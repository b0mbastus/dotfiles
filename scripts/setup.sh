#! /bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPT")

# Ask if ssh key is wished for
while true; do
	read -p 'Do you want to add an ssh-key? ' yn
	case $yn in
		[Yy]* ) mkdir $HOME/.ssh
				### Ask for ssh-public-key
				read -p 'Enter a filename for the key: ' filename
				vi $HOME/.ssh/${filename}
				### Insert public key into athorized
				$HOME/.ssh/${filename} > $HOME/.ssh/authorized_keys
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

chsh -s /bin/zsh

# Setup git
## user.email and user.name
read -p 'Enter your git e-mail: ' email
read -p 'Enter your git name: ' name
git config --global user.email $email
git config --global user.name $name
git config --global core.editor 'vim'

#Clone dotfile repo and checkout correct branch
DOTFILES=$HOME/.dotfiles
git clone https://github.com/JanHanke/config_files.git ${DOTFILES}
cd ${DOTFILES}
git checkout virtual

# Make directory for manually updated packages and install them
mkdir $HOME/packages
cd $HOME/packages
## radare2 (Manual installation)
git clone https://github.com/radare/radare2.git
./radare2/sys/install.sh


# Install oh-my-zsh and copy config files
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -pf ${DOTFILES}/.zshrc $HOME
cp -pf ${DOTFILES}/.tmux.conf $HOME
cp -pf ${DOTFILES}/.vimrc $HOME

# Setup and update vim
#vim -c 'PlugInstall'