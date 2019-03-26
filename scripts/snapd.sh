#!/bin/bash

# snap repo
sudo pacman -S snapd
sudo systemctl enable snapd
sudo systemctl start snapd
