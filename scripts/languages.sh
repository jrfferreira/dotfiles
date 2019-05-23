#!/bin/bash

###############################################
# Golang                                      #
###############################################

sudo pacman --noconfirm -S go

###############################################
# Rust                                        #
###############################################

# Using RustUp to control Rust version
sudo pacman --noconfirm -S rustup
rustup toolchain install stable
rustup default stable
rustup component add rustfmt

###############################################
# Python                                      #
###############################################

# Using pyenv to control Python version
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh

# common dependencies
sudo pacman --noconfirm -S python-virtualenv
sudo pacman --noconfirm -S python-virtualenvwrapper
sudo pacman --noconfirm -S python-pylint
sudo pacman --noconfirm -S python-black

pyenv install 3.6.8
pyenv global system 3.6.8

###############################################
# Node                                        #
###############################################

# Using NVM to control Node version
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# global node modules
sudo pacman --noconfirm -S typescript
sudo pacman --noconfirm -S prettier
sudo pacman --noconfirm -S eslint
sudo pacman --noconfirm -S prettier
zsh -c 'nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier'
