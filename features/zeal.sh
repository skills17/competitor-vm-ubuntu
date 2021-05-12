#!/bin/bash

# install zeal
echo "[Info] When the zeal window opens, choose"
echo "       'Install and update docsets' > 'Available'"
echo "       and install the following ones:"
echo "       - PHP"
echo "       - MySQL"
echo "       - JavaScript"
echo "       - CSS"
echo "       - HTML"
echo "       Then, close all Zeal windows"
echo ""
sleep 10
apt-get install --yes zeal
mv /root/.local/share/Zeal "/home/$USER/.local/share/"
chown -R $USER:$USER "/home/$USER/.local/share/Zeal"
