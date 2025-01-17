# Step 1: Enable the 32-bit architecture
sudo dpkg --add-architecture i386

# Step 2: Add the WineHQ repository
sudo apt update
sudo apt install -y wget gnupg2 software-properties-common
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor > /usr/share/keyrings/winehq-archive.key
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/winehq-archive.key] https://dl.winehq.org/wine-builds/debian/ bullseye main" > /etc/apt/sources.list.d/winehq.list'

# Step 3: Install Wine
sudo apt update
sudo apt install --install-recommends winehq-stable

# Step 4: Verify the installation
wine --version
