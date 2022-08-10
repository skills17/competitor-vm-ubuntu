#!/bin/bash

# install atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
apt-get update
apt-get install --yes atom

# install packages
sudo -u $SUDO_USER apm install emmet
sudo -u $SUDO_USER apm install atom-autocomplete-php
sudo -u $SUDO_USER apm install atom-ternjs
sudo -u $SUDO_USER apm install linter
sudo -u $SUDO_USER apm install linter-php
sudo -u $SUDO_USER apm install linter-eslint-node
