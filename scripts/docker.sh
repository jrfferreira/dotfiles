#!/bin/bash

# docker
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo pacman --noconfirm -S docker
    sudo systemctl enable docker
    sudo systemctl start docker

    sudo groupadd docker
    sudo gpasswd -a $USER docker
    newgrp docker
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install docker
fi
