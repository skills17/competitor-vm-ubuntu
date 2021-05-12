#!/bin/bash

# install sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install --yes apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install --yes sublime-text python python3-pip

# install extensions
if [[ ! -d "$HOME/.config/sublime-text-3/Packages/User/" ]]; then
  sudo -u $USER mkdir -p "$HOME/.config/sublime-text-3/Packages/User/"
fi
if [[ ! -d "$HOME/.config/sublime-text-3/Installed Packages/" ]]; then
  sudo -u $USER mkdir -p "$HOME/.config/sublime-text-3/Installed Packages/"
fi

cp "$SETUP_DIR/configs/sublime/Package Control.sublime-settings" "$HOME/.config/sublime-text-3/Packages/User/Package Control.sublime-settings"
chown $USER:$USER "$HOME/.config/sublime-text-3/Packages/User/Package Control.sublime-settings"
curl -sSL -o "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"
chown $USER:$USER "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package"
sudo -u $USER pip3 install --upgrade --pre CodeIntel
