#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles
CONFIG_FOLDER=~/.config

# ssh-agent
pacman -S keychain

# optimizing and updating pacman
sudo pacman-optimize && sync
sudo pacman -Syu

# pkgfile (search files inside packages)
sudo pacman -S pkgfile
systemctl enable pkgfile-update.timer
systemctl start pkgfile-update.timer

sudo groupadd pkgfile
sudo gpasswd -a $USER pkgfile
newgrp pkgfile

# snap repo
sudo pacman -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd

# docker
sudo pacman -S docker
sudo systemctl enable docker
sudo systemctl start docker

sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

# themes and fonts
sudo pacman -S otf-fira-code
sudo pacman -S arc-gtk-theme


# emacs
sudo pacman -Sy emacs
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
sudo pacman -R xterm
sudo pacman -S terminator
sudo pacman -S bat
sudo pacman -S prettyping
sudo pacman -S netcat

sudo pacman -S the_silver_searcher
sudo pacman -S firefox
sudo snap install telegram-desktop spotify gravit-designer mattermost-desktop chromium
sudo snap install --classic slack

# save/detect xrandr profile
pacman -S autorandr

# go
sudo pacman -S go

# Defining ZSH as default shell
chsh -s /bin/zsh

# common request libs
pacman -S unixodbc

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

sudo pacman -S pa-applet
sudo pacman -S pulseaudio-alsa
sudo pacman -S playerctl
sudo pacman -S pavucontrol
sudo pacman -S light-locker
sudo pacman -S unicode-emoji
sudo pacman -S noto-fonts-emoji

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
mv $CONFIG_FOLDER/terminator/ $CONFIG_FOLDER/terminator.bkp

ln -s $DOTFILES_FOLDER/conky/config ~/.conkyrc
ln -s $DOTFILES_FOLDER/compton/.Xresources ~/.Xresources
ln -s $DOTFILES_FOLDER/i3 $CONFIG_FOLDER/i3
ln -s $DOTFILES_FOLDER/i3blocks/ $CONFIG_FOLDER/i3blocks
ln -s $DOTFILES_FOLDER/rofi/ $CONFIG_FOLDER/rofi
ln -s $DOTFILES_FOLDER/dunst/ $CONFIG_FOLDER/dunst
ln -s $DOTFILES_FOLDER/terminator/ $CONFIG_FOLDER/terminator
ln -s $DOTFILES_FOLDER/pulse/client.conf $CONFIG_FOLDER/pulse/client.conf

# sudo cp $DOTFILES_FOLDER/compton/.Backlight /usr/share/X11/xorg.conf.d/20-intel.conf

# nordvpn
yaourt -S nordvpn-bin
systemctl enable nordvpnd.service
systemctl start nordvpnd.service
