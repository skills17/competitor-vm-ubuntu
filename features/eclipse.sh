#!/bin/bash

# install java
apt-get install --yes openjdk-18-jre-headless

# install eclipse (from official mirror)
curl -L https://rhlx01.hs-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/2021-12/R/eclipse-php-2021-12-R-linux-gtk-x86_64.tar.gz -o /tmp/eclipse.tar.gz
tar -xzf /tmp/eclipse.tar.gz -C /opt
rm /tmp/eclipse.tar.gz

# add it to the applications
cp "$SETUP_DIR/configs/eclipse/eclipse.desktop" /usr/share/applications/eclipse.desktop
update-desktop-database
