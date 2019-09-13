#!/bin/bash

set -e

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

# ZSH
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo pacman --noconfirm -S zsh
    sudo pacman --noconfirm -S bat
    sudo pacman --noconfirm -S fzf
    sudo pacman --noconfirm -S prettyping
    sudo pacman --noconfirm -S netcat
    sudo pacman --noconfirm -S the_silver_searcher
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
curl -L git.io/antigen > $DOTFILES_FOLDER/zsh/antigen.zsh

# Linking settings
set +e
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zshrc ~/.zshrc.bak
set -e

ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv
