#!/bin/bash

# install nodejs
apt-get update
apt-get install --no-install-recommends --yes ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install --yes nodejs

# install global packages
npm install --global eslint

# ensure correct permissions
mkdir -p "$HOME/.config/configstore"
chown -R $SUDO_UID:$SUDO_GID "$HOME/.config/configstore"
chown -R $SUDO_UID:$SUDO_GID "$HOME/.npm"
