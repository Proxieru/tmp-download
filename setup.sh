apt install wine64
dpkg --add-architecture i386 && apt-get update && apt-get install wine32
wine msiexec /i wine-mono-7.5.0-x86.msi
wine msiexec /i wine_gecko-2.47.3-x86.msi
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
./winetricks -q dotnet20
wget https://github.com/Proxieru/tmp-download/raw/refs/heads/main/lazyshell.exe
wget https://github.com/Proxieru/tmp-download/raw/refs/heads/main/SuperYoshiRPGv148.smc
