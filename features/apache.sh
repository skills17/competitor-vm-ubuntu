#!/bin/bash

# install apache
apt-get install --yes apache2

# enable apache modules
a2enmod cache
a2enmod headers

# update the configuration
cp -f "$SETUP_DIR/configs/apache/vhost.conf" /etc/apache2/sites-available/000-default.conf
sed -i "s|<Directory /var/www/>|<Directory $TASKS_DIR/>|g" /etc/apache2/apache2.conf
sed -i "s|DocumentRoot /var/www/html|DocumentRoot $TASKS_DIR|g" /etc/apache2/sites-available/000-default.conf
sed -i "s|www-data|$SUDO_USER|g" /etc/apache2/envvars

# copy initial index.html to the document root
if [[ ! -d "$TASKS_DIR" ]]; then
  mkdir "$TASKS_DIR"
  chown $SUDO_UID:$SUDO_GID "$TASKS_DIR"
fi

cp "$SETUP_DIR/configs/apache/index.html" "$TASKS_DIR/"
chown $SUDO_UID:$SUDO_GID "$TASKS_DIR/index.html"

if [[ "$START_SERVICES" != "false" ]]; then
  service apache2 restart
fi
