#!/bin/bash

# install vscode
curl -L -o /tmp/vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
apt-get install --yes /tmp/vscode.deb
rm /tmp/vscode.deb

# install extensions
sudo -u $SUDO_USER code --install-extension bmewburn.vscode-intelephense-client
sudo -u $SUDO_USER code --install-extension dbaeumer.vscode-eslint

# copy settings
if [[ ! -d "$HOME/.config/Code/User" ]]; then
  sudo -u $SUDO_USER mkdir -p "$HOME/.config/Code/User"
fi
sudo -u $SUDO_USER cp -f "$SETUP_DIR/configs/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
