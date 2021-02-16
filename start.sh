#!/bin/bash

set -e

GREEN='\e[32m'
NC='\e[0m' # No Color

confirm_and_install() {
    echo -e -n "Install ${GREEN}$1${NC} [Y/n]? "
    read choice
    if [[ $choice =~ ^[Yy]$ ]]; then
	source $2
    fi
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # optimizing and updating pacman
    sudo apt-get update && sudo apt-get -y upgrade

    setxkbmap -option 'ctrl:nocaps'

    confirm_and_install "snapd" ./scripts/snapd.sh

    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev git autoconf
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    set +e
    xcode-select --install
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    set -e

    brew tap caskroom/cask
    brew tap caskroom/versions

    brew install coreutils
fi

confirm_and_install "User apps, themes and fonts" ./scripts/user_apps.sh
confirm_and_install "docker" ./scripts/docker.sh
confirm_and_install "zsh" ./scripts/zsh.sh
confirm_and_install "emacs" ./scripts/emacs.sh

confirm_and_install "languages (Go, Python, JS)" ./scripts/languages.sh
confirm_and_install "nordvpn CLI" ./scripts/vpn.sh
