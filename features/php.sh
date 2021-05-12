#!/bin/bash

# install php
apt-get install --yes software-properties-common
add-apt-repository --yes ppa:ondrej/php
apt-get update
apt-get install --yes \
  composer \
  curl \
  libapache2-mod-php8.0 \
  php8.0 \
  php8.0-cli \
  php8.0-xml

service apache2 restart
