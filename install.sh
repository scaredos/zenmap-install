#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt remove nmap -y 
sudo apt autoremove -y
sudo apt install unzip python3-pip build-essential checkinstall zlib1g-dev libssl-dev libcurl4-openssl-dev -y

pip3 install pycairo


cd ~/Downloads/

wget https://github.com/nmap/nmap/archive/refs/heads/master.zip -O nmap.zip

unzip nmap.zip
cd nmap-master/

echo 'Make sure u edit lines 60 for nmap and ndiff paths'

sleep 2

nano zenmap/share/zenmap/config/zenmap

./configure

make

sudo make install

sudo zenmap
