#!/bin/bash

# Variables
WGET_URL="https://raw.githubusercontent.com/Wasd34452/Arch-mirrorlist-on-boot/refs/heads/main/refresh-mirrors.sh"
SERVICE_URL="https://raw.githubusercontent.com/Wasd34452/Arch-mirrorlist-on-boot/refs/heads/main/refresh-mirrors.service"
SCRIPT_PATH="/usr/local/bin/refresh-mirrors.sh"
SERVICE_PATH="/etc/systemd/system/refresh-mirrors.service"

# Install packages
sudo pacman -S --noconfirm wget reflector

# Download and set up script
sudo wget $WGET_URL -O $SCRIPT_PATH
sudo chmod +x $SCRIPT_PATH

# Download service file
sudo wget $SERVICE_URL -O $SERVICE_PATH

# Systemd
sudo systemctl daemon-reload
sudo systemctl enable refresh-mirrors.service
sudo systemctl start refresh-mirrors.service

echo "Setup complete! Mirror list will refresh on boot."
