#!/bin/bash

# install webstorm
if [[ "$(dpkg --print-architecture)" = arm* ]]; then
  curl -L -o /tmp/webstorm.tar.gz "https://download.jetbrains.com/webstorm/WebStorm-2022.3.2-aarch64.tar.gz"
  tar xvf /tmp/webstorm.tar.gz -C /opt
  WEBSTORM_DIR="/opt/$(ls /opt | grep WebStorm-)"
  cp "$SETUP_DIR/configs/webstorm/webstorm.desktop" /usr/share/applications/webstorm.desktop
  sed -i "s#{WEBSTORM_DIR}#${WEBSTORM_DIR}#g" /usr/share/applications/webstorm.desktop
  rm /tmp/webstorm.tar.gz
else
  snap install webstorm --classic
fi
