echo "Installing sudo.."
apt install sudo
echo "Installing nano.."
wget https://github.com/Proxieru/tmp-download/raw/refs/heads/main/
apt install nano
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
sudo apt update
sudo apt install --install-recommends winehq-stable
dpkg --add-architecture i386 && apt-get update && apt-get install wine32
wget https://dl.winehq.org/wine/wine-mono/9.4.0/wine-mono-9.4.0-x86.msi
wine msiexec /i wine-mono-7.5.0-x86.msi
wine msiexec /i wine_gecko-2.47.3-x86.msi
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
./winetricks -q dotnet20
wget https://github.com/Proxieru/tmp-download/raw/refs/heads/main/lazyshell.exe
wget https://github.com/Proxieru/tmp-download/raw/refs/heads/main/SuperYoshiRPGv148.smc
rm -rf setup.sh
