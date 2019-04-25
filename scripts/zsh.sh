#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

# ZSH
sudo pacman --noconfirm -S zsh
sudo pacman --noconfirm -S bat
sudo pacman --noconfirm -S fzf
sudo pacman --noconfirm -S prettyping
sudo pacman --noconfirm -S netcat
sudo pacman --noconfirm -S the_silver_searcher

# Defining ZSH as default shell
chsh -s /bin/zsh

# Using antigen to keep zsh plugins
curl -L git.io/antigen > $DOTFILES_FOLDER/zsh/antigen.zsh

# Linking settings
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zshrc ~/.zshrc.bak
ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv
