#!/bin/bash

DOTFILES_FOLDER=$(dirname "$0")
PARENT_FOLDER=$(dirname $DOTFILES_FOLDER)

sudo apt upgrade
sudo apt update

# fs watch limit
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# essentials
sudo apt-get install -y make build-essential git software-properties-common libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev

# wget https://raw.githubusercontent.com/elementary/wallpapers/master/Ryan%20Schroeder.jpg $DOTFILES_FOLDER/wallpaper.jpg

sudo apt install fonts-firacode

# emacs build
sudo apt install texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev gnutls-dev libgtk-3-dev
git clone https://github.com/emacs-mirror/emacs.git
cd emacs
./autogen.sh
./configure --with-x-toolkit=gtk2
make
sudo make install

# emacs config
mv ~/.emacs.d ~/.emacs.d.bak
mv ~/.emacs ~/.emacs.bak
git clone https://github.com/jrfferreira/emacs-config $PARENT_FOLDER/emacs-config
ln -s $PARENT_FOLDER/emacs-config ~/.emacs.d

# basic apps
sudo apt install firefox tilix zsh silversearcher-ag snapd nordvpn
sudo snap install telegram-desktop slack spotify gravit-designer
wget -qO- https://get.docker.com/ | sh

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# oh-my-zsh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
mv ~/.zshrc ~/.zshrc.bak
ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# tilix
mkdir -p ~/.config/tilix/schemes
wget -qO "~/.config/tilix/schemes/one-dark.json" https://git.io/v7Qaw


zsh

# Adding virtualenv as global
sudo apt install python-dev python3-dev unixodbc unixodbc-dev virtualenv virtualenvwrapper
pyenv install 3.7.1
pyenv global system 3.7.1

# npm modules
nvm install stable && nvm use stable
npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier


