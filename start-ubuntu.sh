#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

sudo apt upgrade
sudo apt update

# fs watch limit
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# essentials
sudo apt-get install -y make build-essential git software-properties-common libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev golang

git config --global credential.helper store
git config --global user.email "jr8116@gmail.com"

sudo apt install fonts-firacode

# emacs build
sudo apt install autoconf texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev gnutls-dev libgtk-3-dev
git clone https://github.com/emacs-mirror/emacs.git $PARENT_FOLDER/emacs
cd $PARENT_FOLDER/emacs
git checkout emacs-26.1
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
sudo apt install firefox tilix zsh silversearcher-ag snapd
sudo snap install telegram-desktop spotify gravit-designer
sudo snap install --classic slack

# Defining ZSH as default shell
chsh -s /bin/zsh

# forcing cinnamon to restart
if ! [hash cinnamon 2>/dev/null]; then
    pkill -HUP -f "cinnamon --replace"
    dconf load /org/cinnamon/ < $DOTFILES_FOLDER/dconf/org.cinnamon
    dconf load /com/gexperts/Tilix/ < $DOTFILES_FOLDER/dconf/com.gexperts.Tilix
fi

# docker if necessary
if ! [hash docker 2>/dev/null]; then wget -qO- https://get.docker.com/ | sh; fi

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# oh-my-zsh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zshrc ~/.zshrc.bak
ln -s $DOTFILES_FOLDER/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES_FOLDER/zsh/.zshenv ~/.zshenv

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# tilix
mkdir -p ~/.config/tilix/schemes
wget -qO "~/.config/tilix/schemes/one-dark.json" https://git.io/v7Qaw

# nordvpn if necessary
if ! [hash nordvpn 2>/dev/null]; then 
    wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
    sudo apt-get install ./nordvpn-release_1.0.0_all.deb
    sudo apt update
    sudo apt install nordvpn
fi

# Adding virtualenv as global
zsh -c 'sudo apt install python-dev python3-dev unixodbc unixodbc-dev virtualenv virtualenvwrapper \
&& pyenv install 3.7.1 \
&& pyenv global system 3.7.1'

# npm modules
zsh -c 'nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier'
