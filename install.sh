#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Update, remove nmap, install dependencies
apt update && sudo apt upgrade -y > /dev/null
apt remove nmap -y > /dev/null
apt autoremove -y > /dev/null
apt install unzip python3-pip build-essential checkinstall zlib1g-dev libssl-dev libcurl4-openssl-dev -y
# Install pycairo
pip3 install pycairo > /dev/null
# Move into our Downloads folder
cd ~/Downloads/ 

# Get the latest nmap release
wget https://github.com/nmap/nmap/archive/refs/heads/master.zip -O nmap.zip
unzip nmap.zip > /dev/null
cd nmap-master/
echo 'Replace ../nmap/nmap and ../ndiff/ndiff with nmap & ndiff'
echo 'Example: ../ndiff/ndiff becomes ndiff'
echo 'Line 60'
echo 'Sleeping so you can read this...'
sleep 10
# Open the zenmap configuration inside of nano
nano zenmap/share/zenmap/config/zenmap.conf
# Run the configuration
./configure
# Make & install, then run zenmap
make
make install
zenmap
