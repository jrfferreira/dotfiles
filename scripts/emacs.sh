#!/bin/bash


PARENT_FOLDER=~/Code

set +e

mv ~/.emacs.d ~/.emacs.d.bak
mv ~/.emacs ~/.emacs.bak

git clone https://github.com/jrfferreira/emacs-config $PARENT_FOLDER/emacs-config

set -e

# emacs
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt install snapd
    sudo snap install emacs --classic
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew tap railwaycat/emacsmacport
    brew cask install emacs
fi

ln -s $PARENT_FOLDER/emacs-config ~/.emacs.d
