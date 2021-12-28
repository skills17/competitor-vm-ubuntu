#!/bin/bash

# install nodejs
curl -L https://deb.nodesource.com/setup_16.x | bash -
apt-get install --yes nodejs

# install global packages
npm install --global eslint

# ensure correct permissions
mkdir -p "$HOME/.config/configstore"
chown -R $SUDO_UID:$SUDO_GID "$HOME/.config/configstore"
