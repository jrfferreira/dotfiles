#!/bin/bash

###############################################
# Golang                                      #
###############################################

# go
sudo pacman -S go


###############################################
# Python                                      #
###############################################

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh
sudo pacman -S python-virtualenv
sudo pacman -S python-virtualenvwrapper
sudo pacman -S python-pylint
sudo pacman -S python-black

pyenv install 3.6.8
pyenv global system 3.6.8


###############################################
# Node                                        #
###############################################

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# global node modules
sudo pacman -S typescript
sudo pacman -S prettier
sudo pacman -S eslint
sudo pacman -S prettier
zsh -c 'nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier'
