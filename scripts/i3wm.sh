#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles
CONFIG_FOLDER=~/.config

# Bluetooth
sudo pacman --noconfirm -S blueman
sudo pacman --noconfirm -S pulseaudio-bluetooth
sudo pacman --noconfirm -S bluez
sudo pacman --noconfirm -S bluez-libs
sudo pacman --noconfirm -S bluez-utils
sudo rfkill unblock bluetooth

#
# Known issue:
#  - https://askubuntu.com/questions/689281/pulseaudio-can-not-load-bluetooth-module
#  - https://wiki.archlinux.org/index.php/Bluetooth_headset#Pairing_works,_but_connecting_does_not
# module-bluetooth-discover need to start after X11 session
#

#i3wm
sudo pacman --noconfirm -S i3-gaps
sudo pacman --noconfirm -S i3status
sudo pacman --noconfirm -S i3exit
sudo pacman --noconfirm -S perl-anyevent-i3
sudo pacman --noconfirm -S pa-applet
sudo pacman --noconfirm -S pulseaudio-alsa
sudo pacman --noconfirm -S playerctl
sudo pacman --noconfirm -S pavucontrol
sudo pacman --noconfirm -S light-locker
sudo pacman --noconfirm -S maim
sudo pacman --noconfirm -S nitrogen


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
