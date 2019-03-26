#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

# ZSH
sudo pacman -S zsh

# Defining ZSH as default shell
chsh -s /bin/zsh

# Using antigen to keep zsh plugins
yaourt -S antigen-git

# Linking settings
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zshrc ~/.zshrc.bak
ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv
