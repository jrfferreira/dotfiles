#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles
CONFIG_FOLDER=~/.config

# optimizing and updating pacman
pacman-optimize && sync
pacman -Syu

# docker
sudo pacman -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd

# themes and fonts
pacman -S otf-fira-code
pacman -S arc-gtk-theme

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
sudo snap install telegram-desktop spotify gravit-designer mattermost-desktop
sudo snap install --classic slack

# go
sudo pacman -S go

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

# nvmshenv

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
sudo pacman -S python-virtualenv
sudo pacman -S python-virtualenvwrapper
zsh -c 'pyenv install 3.6.8 && pyuenv global system 3.6.8'

# global node modules
zsh -c 'nvm install stable && nvm use stable \
&& npm install -g flow flow-bin typescript tern eslint prettier babel-eslint eslint-plugin-react js-beautify eslint-plugin-mocha eslint-plugin-flowtype eslint-plugin-jasmine eslint-plugin-jsx-control-statements eslint-plugin-promise eslint-plugin-jest eslint-plugin-import eslint-plugin-prettier eslint-config-prettier'

#i3wm

sudo pacman -S playerctl

# install i3blocks (default on manjaro)
#git clone https://github.com/vivien/i3blocks $PARENT_FOLDER/i3blocks
#cd $PARENT_FOLDER/i3blocks
#./autogen.sh
#./configure
#make
#make install

# blocks contrib
git clone https://github.com/vivien/i3blocks-contrib ~/.local/src/i3blocks-contrib


# Linking configs
mv ~/.i3 ~/.i3.bkp
mv ~/.conkyrc ~/.conkyrc.bkp
mv ~/.Xresources ~/.Xresources.bkp
mv $CONFIG_FOLDER/i3 $CONFIG_FOLDER/i3
mv $CONFIG_FOLDER/i3blocks/ $CONFIG_FOLDER/i3blocks.bkp
mv $CONFIG_FOLDER/rofi/ $CONFIG_FOLDER/rofi.bkp
mv $CONFIG_FOLDER/dunst/ $CONFIG_FOLDER/dunst.bkp

ln -s $DOTFILES_FOLDER/conky/config ~/.conkyrc
ln -s $DOTFILES_FOLDER/compton/.Xresources ~/.Xresources
ln -s $DOTFILES_FOLDER/i3 $CONFIG_FOLDER/i3
ln -s $DOTFILES_FOLDER/i3blocks/ $CONFIG_FOLDER/i3blocks
ln -s $DOTFILES_FOLDER/rofi/ $CONFIG_FOLDER/rofi
ln -s $DOTFILES_FOLDER/dunst/ $CONFIG_FOLDER/dunst
