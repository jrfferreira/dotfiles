#!/bin/bash

# docker
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt install docker.io
    sudo systemctl enable --now docker

    set +e
    sudo groupadd docker
    sudo gpasswd -a $USER docker
    newgrp docker
    set -e
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask install docker
fi
