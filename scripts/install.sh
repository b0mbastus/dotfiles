#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
DOTFILES_DIR=${DIR}/..

# Create identification file
# export SYSTEM  "Desktop"
# export SYSTEM  "Laptop"
# Select system type:
# 1: Desktop
# 2: Laptop
#

if [ ! -f ${HOME}/scripts/system.sh ]; then
    echo "Select the type of system you are deploying to:"
    echo "1: Desktop"
    echo "2: Laptop"
    read input

    if [ "input" -eq "1"]; then
        ${HOME}/scripts/system.sh < "export SYSTEM "Desktop""
    else if [ "input" -eq "2" ]; then
        ${HOME}/scripts/system.sh < "export SYSTEM "Laptop""
    else
        echo "Please make a valid selection."
    fi
    chmod u+x ${HOME}/scripts/system.sh
fi

# .zshrc
ln -s ${DOTFILES_DIR}/.zshrc $HOME

# .tmux.conf
ln -s ${DOTFILES_DIR}/.tmux.conf $HOME

# .gitconfig

# awesome/

# .bashrc
# .bash_profile


