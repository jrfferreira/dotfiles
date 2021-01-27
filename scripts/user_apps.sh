#!/bin/bash

set -e

DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles
CONFIG_FOLDER=~/.config


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # themes and fonts
    sudo apt install fonts-firacode

    # apps
    apt-get install zsh
    apt-get install bat
    apt-get install fzf
    apt-get install prettyping
    apt-get install netcat
    apt-get install silversearcher-ag

    sudo snap install telegram-desktop spotify gravit-designer mattermost-desktop chromium
    sudo snap install --classic slack
    sudo snap install --classic skype

    apt-get install redshift
    mv $CONFIG_FOLDER/redshift $CONFIG_FOLDER/redshift.bpk
    ln -s $DOTFILES_FOLDER/redshift/ $CONFIG_FOLDER/redshift/

    apt-get install terminator
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
