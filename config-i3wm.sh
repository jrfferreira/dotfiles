#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

I3_CONFIG_FOLDER=~/.config

sudo apt install i3 i3blocks i3lock-fancy rofi dunst compton pulseaudio

mv $I3_CONFIG_FOLDER/i3/config $I3_CONFIG_FOLDER/i3/config.bkp
mv $I3_CONFIG_FOLDER/i3status/config $I3_CONFIG_FOLDER/i3status/config.bpk

ln -s $DOTFILES_FOLDER/i3/i3_config $I3_CONFIG_FOLDER/i3/config
ln -s $DOTFILES_FOLDER/i3/i3status_config $I3_CONFIG_FOLDER/i3status/config
