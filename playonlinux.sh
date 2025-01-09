echo "deb http://archive.ubuntu.com/ubuntu wily main universe" | sudo tee /etc/apt/sources.list.d/wily-copies.list
sudo apt update
wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
wget http://deb.playonlinux.com/playonlinux_stretch.list -O /etc/apt/sources.list.d/playonlinux.list
apt-get update
apt-get install playonlinux
rm playonlinux.sh
