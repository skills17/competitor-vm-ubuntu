#!/bin/bash

mkdir -p "/home/$SUDO_USER/.config/autostart"
cp "$SETUP_DIR/configs/autostart/login.autostart.desktop" "/home/$SUDO_USER/.config/autostart/login.autostart.desktop"
sed -i "s/--user--/$SUDO_USER/g" "/home/$SUDO_USER/.config/autostart/login.autostart.desktop"
chown -R $SUDO_UID:$SUDO_GID "/home/$SUDO_USER/.config/autostart"

mkdir -p "/home/$SUDO_USER/.local/share/skills17/autostart"
cp "$SETUP_DIR/configs/autostart/autostart.sh" "/home/$SUDO_USER/.local/share/skills17/autostart.sh"
cp "$SETUP_DIR/configs/autostart/open-localhost.sh" "/home/$SUDO_USER/.local/share/skills17/autostart/open-localhost.sh"
chown -R $SUDO_UID:$SUDO_GID "/home/$SUDO_USER/.local/share/skills17"
