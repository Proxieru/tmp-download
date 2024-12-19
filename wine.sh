#!/bin/bash

# Add WineHQ repository key 
mkdir -p /etc/apt/keyrings
wget -qO - https://dl.winehq.org/wine-builds/debian/keyring/winehq.key | sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/winehq.key --import 

# Add WineHQ repository to sources list
echo "deb [signed-by=/etc/apt/keyrings/winehq.key] http://dl.winehq.org/wine-builds/debian bullseye main" | sudo tee /etc/apt/sources.list.d/winehq-bullseye.list

# Update package list
apt update

# Install Wine 9.0 (replace 'stable' with 'devel' for development version)
apt install --install-recommends winehq-stable 
