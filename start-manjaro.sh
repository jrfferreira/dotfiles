#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

# optimizing and updating pacman
pacman-optimize && sync
pacman -Syu

# docker
sudo pacman -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd

# emacs
pacman -Sy emacs
mv ~/.emacs.d ~/.emacs.d.bak
mv ~/.emacs ~/.emacs.bak
git clone https://github.com/jrfferreira/emacs-config $PARENT_FOLDER/emacs-config
ln -s $PARENT_FOLDER/emacs-config ~/.emacs.d

# snap
sudo pacman -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd

# apps
sudo pacman -S zsh
sudo pacman -S the_silver_search
sudo pacman -S firefox
sudo snap install telegram-desktop spotify gravit-designer
sudo snap install --classic slack

# Defining ZSH as default shell
chsh -s /bin/zsh

# oh-my-zsh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zshrc ~/.zshrc.bak
ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv

# nvm
pacman -S nvm

# pyenv
pacman -S pyenv
pacman -S pyenv-virtualenvwrapper
zsh -c 'pyenv install 3.6.8 && pyuenv global system 3.6.8'

# global node modules
zsh -c 'nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier'
