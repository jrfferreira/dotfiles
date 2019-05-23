#!/bin/bash

set +e

mv ~/.emacs.d ~/.emacs.d.bak
mv ~/.emacs ~/.emacs.bak

git clone https://github.com/jrfferreira/emacs-config $PARENT_FOLDER/emacs-config

set -e

PARENT_FOLDER=~/Code

# emacs
sudo pacman --noconfirm -Sy emacs
systemctl --user enable --now emacs

ln -s $PARENT_FOLDER/emacs-config ~/.emacs.d
