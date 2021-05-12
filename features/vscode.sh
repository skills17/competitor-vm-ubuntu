#!/bin/bash

# install vscode
curl -L -o /tmp/vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
apt-get install --yes /tmp/vscode.deb
rm /tmp/vscode.deb

# install extensions
sudo -u $USER code --install-extension felixfbecker.php-intellisense
sudo -u $USER code --install-extension dbaeumer.vscode-eslint
