#!/bin/bash
echo "Installing unzip.."
apt install unzip
wget https://github.com/Proxieru/tmp-download/raw/refs/heads/main/disassembler.zip
mkdir disassembler
cd disassembler
unzip disassembler.zip
cd ..
echo "Installing sudo.."
apt-get install -yq sudo > /dev/null 2>&1
echo "Installing nano"
sudo apt-get install -yq nano > /dev/null 2>&1
echo "Installing zsnes.."
apt install zsnes
echo "Installing surf.. (web browser)"
apt install surf
echo "Installing hardinfo.."
apt install hardinfo
echo "Installing wine, wine32 and enabling 32-bit programs.."
sudo dpkg --add-architecture i386 > /dev/null 2>&1
sudo mkdir -pm755 /etc/apt/keyrings > /dev/null 2>&1
sudo wget -q -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -q -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
sudo apt-get update -yq > /dev/null 2>&1
sudo apt-get install -yq --install-recommends winehq-stable > /dev/null 2>&1
dpkg --add-architecture i386 > /dev/null 2>&1
sudo apt-get update -yq > /dev/null 2>&1
sudo apt-get install -yq wine32 > /dev/null 2>&1
echo "Installing vscode"
wget -q -O code_latest_amd64.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i code_latest_amd64.deb > /dev/null 2>&1
sudo apt-get install -f -y
echo "Creating folder for additional setup items"
mkdir "Installed Files" > /dev/null 2>&1
mv disassembler.zip "Installed Files"
wget -q https://dl.winehq.org/wine/wine-mono/9.4.0/wine-mono-9.4.0-x86.msi
wine msiexec /i wine-mono-7.5.0-x86.msi /quiet > /dev/null 2>&1
wine msiexec /i wine_gecko-2.47.3-x86.msi /quiet > /dev/null 2>&1
wget -q https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks > /dev/null 2>&1
./winetricks -q dotnet20 > /dev/null 2>&1
wget -q https://github.com/Yakibomb/LAZYSHELL-UPDATED/releases/download/v2.0.1/LAZYSHELL++.exe
wget -q https://github.com/Proxieru/tmp-download/raw/refs/heads/main/smrpg.sfc
wget -q https://github.com/Proxieru/tmp-download/raw/refs/heads/main/SuperYoshiRPGv1.sfc
wget -q https://github.com/MinicraftPlus/minicraft-plus-revived/releases/download/v2.2.1/minicraft-plus-2.2.1.jar
cd ..
wine --version > /dev/null 2>&1
rm -rf setup.sh
