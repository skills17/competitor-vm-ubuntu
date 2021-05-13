#!/bin/bash

set -e

# require root privileges
if [[ $(id -u) -ne 0 ]]; then
  echo "[Error] Please run the install script as root"
  exit 1
fi

SETUP_DIR="$HOME/.setup"
TASKS_DIR="$HOME/ICTT17"

# update packages & distro
apt-get update
apt-get upgrade --yes
apt-get autoremove --yes

# clone repository
apt-get install --yes git
git clone https://github.com/skills17/competitor-vm-ubuntu.git "$SETUP_DIR"

# install features
source "$SETUP_DIR/scripts/feature.sh"
install_feature system
install_feature apache
install_feature php
install_feature mysql
install_feature phpmyadmin
install_feature nodejs
install_feature vmware
install_feature autostart
install_feature chrome

# install editors and other ui tools
install_feature zeal
install_feature vscode
install_feature sublime
install_feature vim
install_feature atom
install_feature phpstorm
install_feature eclipse
install_feature gimp

# remove setup directory again
rm -rf "$SETUP_DIR"

# reboot the system
shutdown -r now
