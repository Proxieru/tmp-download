#!/bin/bash

# Ensure the script runs with root privileges
if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be run as root (use sudo)."
  exit 1
fi

# Update and upgrade the system
echo "Updating package lists and upgrading installed packages..."
sudo apt update && sudo apt upgrade -y
sudo apt dist-upgrade -y

# Fix broken packages
echo "Fixing broken packages..."
sudo apt --fix-broken install -y

# Clean up the package cache and remove unnecessary packages
echo "Cleaning package cache and removing unnecessary packages..."
sudo apt clean
sudo apt autoremove --purge -y

# Reconfigure any unpacked packages
echo "Reconfiguring any unpacked packages..."
sudo dpkg --configure -a

# Check for missing or broken files
echo "Checking for missing or broken files..."
sudo apt install -f -y

# Verify the integrity of installed packages
echo "Verifying the integrity of installed packages..."
sudo apt install debsums
sudo debsums -s

# Repair filesystem errors (force check on all filesystems)
echo "Checking and repairing filesystem errors..."
sudo fsck -Af -M

# Check and fix broken systemd units if systemd is used
echo "Checking for failed systemd units..."
failed_units=$(sudo systemctl --failed --quiet)
if [[ -n "$failed_units" ]]; then
    echo "Found failed systemd units, attempting to restart them..."
    sudo systemctl reset-failed
    sudo systemctl start <service_name> # Replace <service_name> with the actual service name if known
else
    echo "No failed systemd units found."
fi

# Remove orphaned configuration files (rc status)
echo "Removing orphaned configuration files..."
sudo apt purge $(dpkg -l | grep ^rc | awk '{print $2}') -y

# Check for disk space usage
echo "Checking disk space usage..."
disk_space=$(df -h / | grep -v Filesystem | awk '{print $5}')
echo "Root partition usage: $disk_space"

# Advise on clearing space if root partition is over 80% full
if [[ ${disk_space%?} -gt 80 ]]; then
  echo "Warning: Root partition usage is over 80%. You might want to clean up some files."
fi

# Check for pending updates for security packages
echo "Checking for security updates..."
sudo apt install unattended-upgrades
sudo unattended-upgrade -d

# Attempt to fix any user-specific problems (e.g., broken user configurations)
echo "Checking user configuration issues..."
sudo apt install --reinstall ubuntu-standard

# Print system health status
echo "System repair complete! All potential problems have been attempted to fix."
