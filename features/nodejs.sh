#!/bin/bash

# install nodejs
curl -L https://deb.nodesource.com/setup_14.x | bash -
apt-get install --yes nodejs

# install global packages
npm install --global eslint

# ensure correct permissions
chown -R $SUDO_UID:$SUDO_GID "$HOME/.config/configstore"
