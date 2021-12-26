#!/bin/bash

# install php
apt-get install --yes software-properties-common
add-apt-repository --yes ppa:ondrej/php
apt-get update
apt-get install --yes \
  curl \
  libapache2-mod-php8.1 \
  php8.1 \
  php8.1-cli \
  php8.1-xml

# install composer
curl -sSL https://getcomposer.org/installer -o /tmp/composer-setup.php
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm /tmp/composer-setup.php

if [[ "$START_SERVICES" != "false" ]]; then
  service apache2 restart
fi
