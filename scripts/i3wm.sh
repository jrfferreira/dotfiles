#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles
CONFIG_FOLDER=~/.config

# Bluetooth
sudo pacman -S blueman
sudo pacman -S pulseaudio-bluetooth
sudo pacman -S bluez
sudo pacman -S bluez-libs
sudo pacman -S bluez-utils
sudo rfkill unblock bluetooth

#
# Known issue:
#  - https://askubuntu.com/questions/689281/pulseaudio-can-not-load-bluetooth-module
#  - https://wiki.archlinux.org/index.php/Bluetooth_headset#Pairing_works,_but_connecting_does_not
# module-bluetooth-discover need to start after X11 session
#

#i3wm
sudo pacman -S perl-anyevent-i3
sudo pacman -S pa-applet
sudo pacman -S pulseaudio-alsa
sudo pacman -S playerctl
sudo pacman -S pavucontrol
sudo pacman -S light-locker
sudo pacman -S maim


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
