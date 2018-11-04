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

if [[ ! -d ${HOME}/scripts ]]; then
    mkdir ${HOME}/scripts
fi

while [[ ! -f ${HOME}/scripts/system.sh ]]; do
    echo "Select the type of system you are deploying to:"
    echo "1: Desktop"
    echo "2: Laptop"
    read input

    if [[ "$input" -eq "1" ]]; then
        echo "export SYSTEM 'Desktop'" > ${HOME}/scripts/system.sh
    elif [[ "$input" -eq "2" ]]; then
        echo "export SYSTEM 'Laptop'" > ${HOME}/scripts/system.sh
    else
        echo "Please make a valid selection."
    fi
done

chmod u+x ${HOME}/scripts/system.sh

# .zshrc
#ln -s ${DOTFILES_DIR}/.zshrc $HOME

# .tmux.conf
#ln -s ${DOTFILES_DIR}/.tmux.conf $HOME

# .gitconfig

# awesome/

# .bashrc
# .bash_profile


