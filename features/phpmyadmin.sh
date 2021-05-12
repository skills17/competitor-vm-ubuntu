#!/bin/bash

# install phpmyadmin
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install --yes phpmyadmin

# configure phpmyadmin
chown $USER:$USER /var/lib/phpmyadmin/tmp
cp "$SETUP_DIR/configs/phpmyadmin/config.trade17.php" /etc/phpmyadmin/conf.d/config.trade17.php
chown $USER:$USER /etc/phpmyadmin/conf.d/config.trade17.php
