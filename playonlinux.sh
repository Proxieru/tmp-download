apt-get install software-properties-common
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install python-wxgtk2.8
wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
wget http://deb.playonlinux.com/playonlinux_stretch.list -O /etc/apt/sources.list.d/playonlinux.list
apt-get update
apt-get install playonlinux
rm playonlinux.sh
