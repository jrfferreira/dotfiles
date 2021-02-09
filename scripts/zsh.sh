#!/bin/bash

set -e

PARENT_FOLDER="~/Code"
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

# ZSH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install -y zsh
    sudo apt-get install -y bat
    sudo apt-get install -y fzf
    sudo apt-get install -y prettyping
    sudo apt-get install -y netcat
    sudo apt-get install -y silversearcher-ag

    set +e
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
    set -e

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
    brew install ag
    brew install bat
    brew install prettyping
    brew install htop
    brew install fzf
fi

# Defining ZSH as default shell
chsh -s /bin/zsh

# Using antigen to keep zsh plugins
touch $DOTFILES_FOLDER/zsh/antigen.zsh
curl -L git.io/antigen > $DOTFILES_FOLDER/zsh/antigen.zsh

# Linking settings
set +e
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zshrc ~/.zshrc.bak
set -e

ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv
