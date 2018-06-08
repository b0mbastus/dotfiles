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
fi
