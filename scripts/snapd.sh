#!/bin/bash

set -e

# snap repo
sudo apt install snapd
sudo systemctl enable snapd
sudo systemctl start snapd
