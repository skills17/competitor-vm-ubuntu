#!/bin/bash

# install phpmyadmin
echo "[Info] Answer the upcoming questions like this:"
echo "       - Web server to reconfigure automatically:                  apache"
echo "       - Configure database for phpmyadmin with dbconfig-common?   Yes"
echo "       - MySQL application password for phpmyadmin:                (leave blank)"
echo ""
echo "       Press any key to continue"
read -n 1 -s
apt-get install --yes phpmyadmin

# configure phpmyadmin
chown $USER:$USER /var/lib/phpmyadmin/tmp
cp "$SETUP_DIR/configs/phpmyadmin/config.trade17.php" /etc/phpmyadmin/conf.d/config.trade17.php
chown $USER:$USER /etc/phpmyadmin/conf.d/config.trade17.php
