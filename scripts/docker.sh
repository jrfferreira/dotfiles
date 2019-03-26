#!/bin/bash

# docker
sudo pacman -S docker
sudo systemctl enable docker
sudo systemctl start docker

sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
