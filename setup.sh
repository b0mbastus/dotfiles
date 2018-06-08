#! /bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPT")

# Create user
## Ask for username and password
if [ $(id -u) -eq 0 ]; then
        read -p 'Enter username: ' username
        read -sp 'Enter password: ' password
        while true; do
                egrep "^$username" /etc/passwd > /dev/null
                if [ $? -eq 0 ]; then
                        echo "$username exists!"
                        read -p 'Enter username: ' username
                        read -sp 'Enter Password: ' password
                        continue;
                else
                        # Add user to sudo group
                        adduser $username --gecos "" --disabled-login
                        echo "$username:$password" | chpasswd
                        usermod -aG sudo $username
                        break;
                fi
        done
        # Change to user
        #su - $username
fi

# Ask if ssh key is wished for
while true; do
	read -p 'Do you want to add an ssh-key? ' yn
	case $yn in
		[Yy]* ) mkdir /home/$username/.ssh
				### Ask for ssh-public-key
				read -p 'Enter a filename for the key: ' filename
				vi /home/$username/.ssh/$filename
				### Insert public key into athorized
				/home/$username/.ssh/$filename > /home/$username/.ssh/authorized_keys
				break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

# Update and upgrade apt
sudo apt-get update
sudo apt-get upgrade

# Install necessary programs
programs=(zsh zsh-syntax-highlighting bash-completion vim git htop tmux ranger powerline python g++ make gdb nmap curl)
sudo apt-get install -y ${programs[*]}

#chsh -s /bin/zsh
usermod -s /bin/zsh $username

# Setup git
## user.email and user.name
read -p 'Enter your git e-mail: ' email
read -p 'Enter your git name: ' name
su - $username -c "git config --global user.mail $email"
su - $username -c "git config --global user.name $name"
su - $username -c "git config --global core.editor 'vim'"

#Clone dotfile repo and checkout correct branch
DOTFILES='/home/$username/.dotfiles'
git clone https://github.com/JanHanke/config_files.git $DOTFILES
cd $DOTFILES
git checkout -b virtual

# Make directory for manually updated packages and install them
mkdir /home/$username/packages
cd /home/$username/packages
## radare2 (Manual installation)
git clone https://github.com/radare/radare2.git
./radare2/sys/install.sh


# Install oh-my-zsh and copy config files
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -pf $DOTFILES/.zshrc /home/$username
cp -pf $DOTFILES/.tmux.conf /home/$username
cp -pf $DOTFILES/.vimrc /home/$username

# Setup and update vim
vim -c 'PlugInstall'

su - $username
