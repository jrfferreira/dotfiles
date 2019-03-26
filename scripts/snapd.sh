#!/bin/bash

# snap repo
sudo pacman --noconfirm -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd
