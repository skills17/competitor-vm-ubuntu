#!/bin/bash

# install phpstorm
if [[ "$(dpkg --print-architecture)" = arm* ]]; then
  curl -L -o /tmp/phpstorm.tar.gz "https://download.jetbrains.com/webide/PhpStorm-2023.1.4-aarch64.tar.gz"
  tar xvf /tmp/phpstorm.tar.gz -C /opt
  PHPSTORM_DIR="/opt/$(ls /opt | grep PhpStorm-)"
  cp "$SETUP_DIR/configs/phpstorm/phpstorm.desktop" /usr/share/applications/phpstorm.desktop
  sed -i "s#{PHPSTORM_DIR}#${PHPSTORM_DIR}#g" /usr/share/applications/phpstorm.desktop
  rm /tmp/phpstorm.tar.gz
else
  snap install phpstorm --classic
fi
