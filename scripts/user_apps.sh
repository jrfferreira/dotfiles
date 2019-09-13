#!/bin/bash

set -e

DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles
CONFIG_FOLDER=~/.config


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # themes and fonts
    sudo pacman --noconfirm -S otf-fira-code
    sudo pacman --noconfirm -S arc-gtk-theme
    sudo pacman --noconfirm -S unicode-emoji
    sudo pacman --noconfirm -S noto-fonts-emoji

    # apps
    sudo pacman -R xterm
    sudo pacman --noconfirm -S bat
    sudo pacman --noconfirm -S fzf
    sudo pacman --noconfirm -S prettyping
    sudo pacman --noconfirm -S netcat
    sudo pacman --noconfirm -S the_silver_searcher
    sudo pacman --noconfirm -S autorandr

    sudo pacman --noconfirm -S firefox

    sudo snap install telegram-desktop spotify gravit-designer mattermost-desktop chromium
    sudo snap install --classic slack
    sudo snap install --classic skype

    sudo pacman --noconfirm -S redshift
    mv $CONFIG_FOLDER/redshift $CONFIG_FOLDER/redshift.bpk
    ln -s $DOTFILES_FOLDER/redshift/ $CONFIG_FOLDER/redshift/

    sudo pacman --noconfirm -S terminator
    mv $CONFIG_FOLDER/terminator $CONFIG_FOLDER/terminator.bpk
    ln -s $DOTFILES_FOLDER/terminator/ $CONFIG_FOLDER/terminator

elif [[ "$OSTYPE" == "darwin"* ]]; then

    brew install zsh
    brew install ag
    brew install bat
    brew install prettyping
    brew install htop
    brew install fzf

    set +e
    brew tap caskroom/fonts
    brew cask install font-fira-mono
    brew cask install font-fira-code
    brew cask install font-fira-mono-for-powerline
    brew cask install font-source-code-pro

    brew cask install iterm2
    brew cask install firefox
    brew cask install chrome
    brew cask install sketch

    # usability
    brew cask install spectacle
    brew cask install authy
    brew cask install istat-menus

    # fun
    brew cask install spotify
    brew cask install vlc
    brew cask install webtorrent
    brew cask install skype
    brew cask install wireshark
    set -e
fi
