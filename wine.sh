sudo apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc
sudo tee /etc/apt/sources.list.d/wxwidgets.list <<EOF
deb http://repos.codelite.org/wx3.0.2/ubuntu/   $(lsb_release -sc) universe
EOF
sudo apt-get updat
