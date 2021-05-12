#!/bin/bash

# disable the lock screen & screensaver
sudo -u $SUDO_USER gsettings set org.gnome.desktop.lockdown disable-lock-screen true
sudo -u $SUDO_USER gsettings set org.gnome.desktop.screensaver lock-enabled false
sudo -u $SUDO_USER gsettings set org.gnome.desktop.session idle-delay 0

# disable automatic updates
sed -i 's/Update-Package-Lists "1"/Update-Package-Lists "0"/g' /etc/apt/apt.conf.d/20auto-upgrades
sed -i 's/Unattended-Upgrade "1"/Unattended-Upgrade "0"/g' /etc/apt/apt.conf.d/20auto-upgrades
