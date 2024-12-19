wget https://dl.winehq.org/wine/source/9.0/wine-9.0.tar.xz
tar -xvf wine-9.0.tar.xz
cd wine-9.0/
sudo ./configure 
sudo ./configure --enable-win64
sudo make && sudo make install
