#!/bin/bash

set -e

SETUP_DIR="$HOME/.setup"
TASKS_DIR="$HOME/ICTT17"

# require root privileges
if [[ $(id -u) -ne 0 ]]; then
  echo "[Error] Please run the install script as root"
  exit 1
fi

# update packages & distro
apt-get update
apt-get upgrade --yes
apt-get autoremove --yes

# clone repository
apt-get install --yes git
git clone https://github.com/skills17/competitor-vm-ubuntu.git "$SETUP_DIR"

# install features
source "$SETUP_DIR/features/install.sh"
install_feature system
install_feature apache
install_feature php
install_feature mysql
install_feature phpmyadmin

# remove setup directory again
rm -rf "$SETUP_DIR"

# reboot the system
shutdown -r now
