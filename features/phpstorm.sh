#!/bin/bash

# install phpstorm
if [[ "$(dpkg --print-architecture)" = arm* ]]; then
  curl -L -o /tmp/phpstorm.tar.gz "https://download.jetbrains.com/webide/PhpStorm-2022.3.2-aarch64.tar.gz"
  tar xvf /tmp/phpstorm.tar.gz -C /opt
  PHPSTORM_DIR="/opt/$(ls /opt | grep PhpStorm-)"
  cp "$SETUP_DIR/configs/phpstorm/phpstorm.desktop" /usr/share/applications/phpstorm.desktop
  sed -i "s#{PHPSTORM_DIR}#${PHPSTORM_DIR}#g" /usr/share/applications/phpstorm.desktop
else
  snap install phpstorm --classic
fi
