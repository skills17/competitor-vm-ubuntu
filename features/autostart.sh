#!/bin/bash

mkdir -p "$HOME/.config/autostart"
cp "$SETUP_DIR/configs/autostart/login.autostart.desktop" "$HOME/.config/autostart/login.autostart.desktop"
sed -i "s/--user--/$SUDO_USER/g" "$HOME/.config/autostart/login.autostart.desktop"
chown -R $SUDO_UID:$SUDO_GID "$HOME/.config/autostart"

mkdir -p "$HOME/.local/share/skills17/autostart"
cp "$SETUP_DIR/configs/autostart/autostart.sh" "$HOME/.local/share/skills17/autostart.sh"
cp "$SETUP_DIR/configs/autostart/open-localhost.sh" "$HOME/.local/share/skills17/autostart/open-localhost.sh"
chown -R $SUDO_UID:$SUDO_GID "$HOME/.local/share/skills17"
