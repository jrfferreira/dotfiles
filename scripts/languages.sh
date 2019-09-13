#!/bin/bash

set -e

###############################################
# Golang                                      #
###############################################

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo pacman --noconfirm -S go
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install go
fi


###############################################
# Rust                                        #
###############################################
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Using RustUp to control Rust version
    sudo pacman --noconfirm -S rustup
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

    # common dependencies
    sudo pacman --noconfirm -S python-virtualenv
    sudo pacman --noconfirm -S python-virtualenvwrapper
    sudo pacman --noconfirm -S python-pylint
    sudo pacman --noconfirm -S python-black

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install python
    brew install pyenv
    brew install mypy
    brew install black
fi

pyenv install 3.6.8
pyenv global system 3.6.8

pip install virtualenvwrapper

###############################################
# Node                                        #
###############################################

# Using NVM to control Node version
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo pacman --noconfirm -S typescript
    sudo pacman --noconfirm -S prettier
    sudo pacman --noconfirm -S eslint
    sudo pacman --noconfirm -S prettier
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install typescript
    brew install prettier
    brew install eslint
    brew install prettier
fi

# global node modules
zsh -c 'nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier'

sudo npm install -g terminalizer

# If error node_modules/jpegtran-bin/vendor/jpegtran ENOENT:
# Check issue - https://github.com/imagemin/imagemin/issues/154
# npm rebuild jpegtran-bin


###############################################
# MariaDB                                     #
###############################################

# https://wiki.archlinux.org/index.php/MariaDB

if [[ "$OSTYPE" == "linux-gnu" ]]; then
   sudo pacman --noconfirm -S mariadb
   mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi
