#!/bin/bash

# pkgfile (search files inside packages)
sudo pacman --noconfirm -S pkgfile
systemctl enable pkgfile-update.timer
systemctl start pkgfile-update.timer

sudo groupadd pkgfile
sudo gpasswd -a $USER pkgfile
newgrp pkgfile
