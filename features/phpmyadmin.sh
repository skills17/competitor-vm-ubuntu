#!/bin/bash

# install phpmyadmin
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install --yes phpmyadmin

# configure phpmyadmin
chown $SUDO_UID:$SUDO_GID /var/lib/phpmyadmin/tmp
cp "$SETUP_DIR/configs/phpmyadmin/config.skills17.php" /etc/phpmyadmin/conf.d/config.skills17.php
chown $SUDO_UID:$SUDO_GID /etc/phpmyadmin/conf.d/config.skills17.php
