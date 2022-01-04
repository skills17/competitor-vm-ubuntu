#!/bin/bash

# install phpmyadmin
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install --yes phpmyadmin

# configure phpmyadmin
chown $SUDO_UID:$SUDO_GID /var/lib/phpmyadmin/tmp
cp "$SETUP_DIR/configs/phpmyadmin/config.skills17.php" /etc/phpmyadmin/conf.d/config.skills17.php
chown $SUDO_UID:$SUDO_GID /etc/phpmyadmin/conf.d/config.skills17.php

# update to latest version (the one in the ubundu apt is always outdated)
rm -rf /usr/share/phpmyadmin/
mkdir -p /usr/share/phpmyadmin/
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz -O /tmp/phpmyadmin.tar.gz
tar xzf /tmp/phpmyadmin.tar.gz -C /tmp
mv /tmp/phpMyAdmin-*/* /usr/share/phpmyadmin
sed -i -r "s/('TEMP_DIR'\s*,)[^\)]*/\1 '\/var\/lib\/phpmyadmin\/tmp\/'/" /usr/share/phpmyadmin/libraries/vendor_config.php
sed -i -r "s/('CONFIG_DIR'\s*,)[^\)]*/\1 '\/etc\/phpmyadmin\/'/" /usr/share/phpmyadmin/libraries/vendor_config.php
rm /tmp/phpmyadmin.tar.gz
