#!/bin/bash

# CURRENT ISSUES
# * If file is present, it will always copy it and add a timestamp to the old file

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
DOTFILES_DIR=${DIR}/..

source ${DIR}/util.sh

# Create system file
while [[ ! -f ${HOME}/system.sh ]]; do
    echo "Select the type of system you are deploying to:"
    echo "1: Desktop"
    echo "2: Laptop"
    read input

    if [[ "$input" -eq "1" ]]; then
        echo "export SYSTEM='Desktop'" > ${HOME}/system.sh
        chmod u+x ${HOME}/system.sh
    elif [[ "$input" -eq "2" ]]; then
        echo "export SYSTEM='Laptop'" > ${HOME}/system.sh
        chmod u+x ${HOME}/system.sh
    else
        echo "Please make a valid selection."
    fi
done

source ${HOME}/system.sh

# scripts directory
if [[ -d ${HOME}/scripts && ! -L ${HOME}/scripts ]]; then
    mv ${HOME}/scripts ${HOME}/scripts.old.`timestamp`
    ln -s ${DOTFILES_DIR}/scripts $HOME/scripts
fi
if [[ ! -e ${HOME}/scripts ]]; then
    ln -s ${DOTFILES_DIR}/scripts $HOME/scripts
fi

# .zshrc
if [[ -f ${HOME}/.zshrc && ! -L ${HOME}/.zshrc ]]; then
    mv ${HOME}/.zshrc ${HOME}/.zshrc.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.zshrc $HOME
fi
if [[ ! -e ${HOME}/.zshrc ]]; then
    ln -s ${DOTFILES_DIR}/.zshrc $HOME
fi

# .bashrc
if [[ -f ${HOME}/.bashrc && ! -L ${HOME}/.bashrc ]]; then
    mv ${HOME}/.bashrc ${HOME}/.bashrc.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.bashrc $HOME
fi
if [[ ! -e ${HOME}/.bashrc ]]; then
    ln -s ${DOTFILES_DIR}/.bashrc $HOME
fi

# .bash_profile
if [[ -f ${HOME}/.bash_profile && ! -L ${HOME}/.bash_profile ]]; then
    mv ${HOME}/.bash_profile ${HOME}/.bash_profile.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.bash_profile $HOME
fi
if [[ ! -e ${HOME}/.bash_profile ]]; then
    ln -s ${DOTFILES_DIR}/.bash_profile $HOME
fi

# .tmux.conf
if [[ -f ${HOME}/.tmux.conf && ! -L ${HOME}/.tmux.conf ]]; then
    mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.tmux.conf $HOME
fi
if [[ ! -e ${HOME}/.tmux.conf ]]; then
    ln -s ${DOTFILES_DIR}/.tmux.conf $HOME
fi

# .vimrc
if [[ -f ${HOME}/.vimrc && ! -L ${HOME}/.vimrc ]]; then
    mv ${HOME}/.vimrc ${HOME}/.vimrc.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.vimrc $HOME
fi
if [[ ! -e ${HOME}/.vimrc ]]; then
    ln -s ${DOTFILES_DIR}/.vimrc $HOME
fi

# .Xresources
if [[ $SYSTEM == "Laptop" ]]; then
    XRESOURCES=${DOTFILES_DIR}/.Xresources_laptop
else
    XRESOURCES=${DOTFILES_DIR}/.Xresources
fi

if [[ -f ${HOME}/.Xresources && ! -L ${HOME}/.Xresources ]]; then
    mv ${HOME}/.Xresources ${HOME}/.Xresources.old.`timestamp`
    ln -s $XRESOURCES $HOME/.Xresources
fi
if [[ ! -e ${HOME}/.Xresources ]]; then
    ln -s $XRESOURCES $HOME/.Xresources
else
    ln -sf $XRESOURCES $HOME/.Xresources
fi

# .gitconfig
if [[ -f ${HOME}/.gitconfig && ! -L ${HOME}/.gitconfig ]]; then
    mv ${HOME}/.gitconfig ${HOME}/.gitconfig.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.gitconfig $HOME
fi
if [[ ! -e ${HOME}/.gitconfig ]]; then
    ln -s ${DOTFILES_DIR}/.gitconfig $HOME
fi

# awesome/
if [[ -d ${HOME}/.config/awesome && ! -L ${HOME}/.config/awesome ]]; then
    mv ${HOME}/.config/awesome ${HOME}/.config/awesome.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.config/awesome ${HOME}/.config/awesome
fi
if [[ ! -e ${HOME}/.config/awesome ]]; then
    ln -s ${DOTFILES_DIR}/.config/awesome ${HOME}/.config/awesome
fi

# rofi/
if [[ -d ${HOME}/.config/rofi && ! -L ${HOME}/.config/rofi ]]; then
    mv ${HOME}/.config/rofi ${HOME}/.config/rofi.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.config/rofi ${HOME}/.config/rofi
fi
if [[ ! -e ${HOME}/.config/rofi ]]; then
    ln -s ${DOTFILES_DIR}/.config/rofi ${HOME}/.config/rofi
fi

# GDB + GDB-Dashboard and GEF
# .gdbinit.d/
if [[ -d ${HOME}/.gdbinit.d && ! -L ${HOME}/.gdbinit.d ]]; then
    mv ${HOME}/.gdbinit.d ${HOME}/.gdbinit.d.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.gdbinit.d ${HOME}/.gdbinit.d
fi
if [[ ! -e ${HOME}/.gdbinit.d ]]; then
    ln -s ${DOTFILES_DIR}/.gdbinit.d ${HOME}/.gdbinit.d
fi

# .gdbinit
if [[ -f ${HOME}/.gdbinit && ! -L ${HOME}/.gdbinit ]]; then
    mv ${HOME}/.gdbinit ${HOME}/.gdbinit.old.`timestamp`
    ln -s ${DOTFILES_DIR}/.gdbinit $HOME
fi
if [[ ! -e ${HOME}/.gdbinit ]]; then
    ln -s ${DOTFILES_DIR}/.gdbinit $HOME
fi

# .gdbinit-gef.py
# Erases content of .gdbinit
# wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
