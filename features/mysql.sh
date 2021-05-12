#!/bin/bash

# install mysql
apt-get install --yes mysql-server

# configure mysql
echo "[Info] Answer the upcoming questions like this:"
echo "       - Would you like to setup VALIDATE PASSWORD component?   n"
echo "       - Please set the password for root here.                 root"
echo "       - Remove anonymous users?                                y"
echo "       - Disallow root login remotely?                          y"
echo "       - Remove test database and access to it?                 y"
echo "       - Reload privilege tables now?                           y"
echo ""
echo "       Press any key to continue"
read -n 1 -s
mysql_secure_installation
mysql --user=root --password=root --execute="ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';"
