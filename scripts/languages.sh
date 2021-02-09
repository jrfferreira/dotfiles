#!/bin/bash

set -e

###############################################
# Golang                                      #
###############################################

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install golang
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install go
fi


###############################################
# Rust                                        #
###############################################
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Using RustUp to control Rust version
    snap install --classic rustup
    rustup toolchain install stable
    rustup default stable
    rustup component add rustfmt
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install rustup
    set +e
    rustup-init
    set -e
fi
###############################################
# Python                                      #
###############################################

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Using pyenv to control Python version
    # git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh

    # pyenv-virtualenvwrapper
    git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
    
    # common dependencies
    sudo apt-get install libffi-dev
    sudo apt-get install python-ctypes
    sudo apt-get install virtualenv
    sudo apt-get install virtualenvwrapper
    sudo apt-get install pylint
    sudo apt-get install black

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install python
    brew install pyenv
    brew install mypy
    brew install black
    brew install pyenv-virtualenvwrapper
fi

pyenv install 3.7.4
pyenv global 3.7.4

pip install virtualenvwrapper

###############################################
# Node                                        #
###############################################

# Using NVM to control Node version
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install typescript
    sudo apt-get install prettier
    sudo apt-get install eslint
    sudo snap install --beta prettier
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install typescript
    brew install prettier
    brew install eslint
    brew install prettier
fi

# global node modules
nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier \
&& npm config set ignore-scripts true

sudo npm install -g terminalizer

# If error node_modules/jpegtran-bin/vendor/jpegtran ENOENT:
# Check issue - https://github.com/imagemin/imagemin/issues/154
# npm rebuild jpegtran-bin
