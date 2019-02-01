#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

dconf load /org/cinnamon/ < $DOTFILES_FOLDER/dconf/org.cinnamon
dconf load /com/gexperts/Tilix/ < $DOTFILES_FOLDER/dconf/com.gexperts.Tilix
pkill -HUP -f "cinnamon --replace"
