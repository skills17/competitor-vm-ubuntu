#!/bin/bash

# install php
apt-get install --yes software-properties-common
add-apt-repository --yes ppa:ondrej/php
apt-get update
apt-get install --yes \
  curl \
  libapache2-mod-php8.0 \
  php8.0 \
  php8.0-cli \
  php8.0-xml

# install composer
curl -sSL https://getcomposer.org/installer -o /tmp/composer-setup.php
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm /tmp/composer-setup.php

service apache2 restart
