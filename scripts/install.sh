#!/bin/bash

set -e

SETUP_DIR="$HOME/.setup"

# update packages & distro
apt-get update
apt-get upgrade --yes
apt-get autoremove --yes

# clone repository
apt-get install --yes git
git clone https://github.com/skills17/competitor-vm-ubuntu.git "$SETUP_DIR"

# install features
source "$SETUP_DIR/features/install.sh"

# remove setup directory again
rm -rf "$SETUP_DIR"
