#!/bin/bash
sudo dnf update
sudo dnf upgrade

sudo dnf install emacs
sudo dnf install zsh
sudo dnf install the_silver_searcher

sudo dnf install arc-theme
sudo dnf install gnome-tweak-tool
sudo dnf install chrome-gnome-shell
sudo dnf install snapd

sudo ln -s /var/lib/snapd/snap /snap

sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel

sudo dnf copr enable evana/fira-code-fonts
sudo dnf install fira-code-fonts

sudo snap install telegram-desktop
sudo snap install spotify
sudo snap install slack --classic

sudo dnf install golang

git config --global credential.helper store
git config --global user.email "jr8116@gmail.com"

# base folders
mkdir ~/Code

# dconf
dconf load / < gnome.dconf

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# oh-my-zsh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
ln -s ./zsh/.zshrc ~/.zshrc


# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# npm modules
nvm install stable && nvm use stable
npm install -g flow tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier


# emacs
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak
git clone https://github.com/jrfferreira/emacs-config ~/Code/emacs-config
ln -s ~/Code/emacs-config .emacs.d
