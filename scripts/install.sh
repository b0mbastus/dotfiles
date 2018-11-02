#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
DOTFILES_DIR=${DIR}/..

# .zshrc
ln -s ${DOTFILES_DIR}/.zshrc $HOME

# .tmux.conf
ln -s ${DOTFILES_DIR}/.tmux.conf $HOME

# .gitconfig

# awesome/

# .bashrc
# .bash_profile


