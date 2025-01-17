#!/bin/bash

# Script to remove Wine 5 and install the latest Wine version on Debian 11 (Bullseye)

# Function to print messages
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root (e.g., using sudo)."
    exit 1
fi

# Remove existing Wine
log "Removing existing Wine installation..."
apt remove --purge -y wine wine32 wine64 winehq-stable winehq-devel winehq-staging
apt autoremove --purge -y
rm -rf ~/.wine /etc/apt/sources.list.d/winehq*.list

# Enable 32-bit architecture
log "Enabling 32-bit architecture..."
dpkg --add-architecture i386

# Add WineHQ key
log "Adding WineHQ key..."
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

# Add the official WineHQ repository for Debian 11 (Bullseye)
log "Adding WineHQ repository for Debian 11..."
echo "deb [signed-by=/etc/apt/keyrings/winehq-archive.key] https://dl.winehq.org/wine-builds/debian/ bullseye main" > /etc/apt/sources.list.d/winehq.list

# Update package lists
log "Updating package lists..."
apt update

# Install Wine dependencies
log "Installing Wine dependencies..."
apt install -y winehq-stable wine32 wine64

# Install the latest Wine stable version
log "Installing the latest Wine stable version..."
apt install --install-recommends -y winehq-stable

# Verify installation
log "Verifying Wine installation..."
WINE_VERSION=$(wine --version 2>/dev/null)
if [ -n "$WINE_VERSION" ]; then
    log "Wine installation successful! Installed version: $WINE_VERSION"
else
    log "Wine installation failed. Please check the logs."
fi

log "Done."
