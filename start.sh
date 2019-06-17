#!/bin/bash

set -e

GREEN='\e[32m'
NC='\e[0m' # No Color

confirm_and_install() {
    echo -e -n "Install ${GREEN}$1${NC} [Y/n]? "
    read choice
    if [[ $choice =~ ^[Yy]$ ]]
    then
	source $2
    fi
}

# optimizing and updating pacman
sudo pacman-optimize && sync
sudo pacman -Syu

setxkbmap -option 'ctrl:nocaps'

# essentials
sudo pacman --noconfirm -S make
sudo pacman --noconfirm -S gcc
sudo pacman --noconfirm -S jq
sudo pacman --noconfirm -S gconf

# ssh-agent
sudo pacman --noconfirm -S keychain

# common request libs
sudo pacman --noconfirm -S unixodbc

confirm_and_install "snapd" ./scripts/snapd.sh
confirm_and_install "User apps, themes and fonts" ./scripts/user_apps.sh

confirm_and_install "pkgfile" ./scripts/pkgfile.sh
confirm_and_install "docker" ./scripts/docker.sh
confirm_and_install "zsh" ./scripts/zsh.sh
confirm_and_install "emacs" ./scripts/emacs.sh
confirm_and_install "i3wm" ./scripts/i3wm.sh
confirm_and_install "languages (Go, Python, JS)" ./scripts/languages.sh
confirm_and_install "nordvpn CLI" ./scripts/vpn.sh
