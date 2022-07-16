#!/bin/bash
read -t 3 -p "starting the installation"
sudo apt-get update && sudo apt-get upgrade -y


read -t 3 -p "Downloading and installing .deb"
wget https://github.com/pocketnetteam/pocketnet.core/releases/download/v0.20.25/pocketnetcore_0.20.25_linux_x64_setup.deb --no-check-certificate
sudo dpkg -i pocketnetcore_*_linux_x64_setup.deb

read -t 3 -p "Making the directories"
mkdir /root/.pocketcoin
mkdir /root/.pocketcoin/checkpoints
cd /root/.pocketcoin/checkpoints
wget https://github.com/pocketnetteam/pocketnet.core/releases/latest/download/main.sqlite3
cd ~

read -t 3 -p "downloading pocketcoin.conf"
wget https://raw.githubusercontent.com/rabakuku/AutoPocketNet.Core/main/pocketcoin.conf -O ~/.pocketcoin/pocketcoin.conf


read -t 3 -p  "dowloading and unziping the blockchain"
cd  /root/.pocketcoin/
rm -r /root/.pocketcoin/blocks
rm -r /root/.pocketcoin/chainstate
rm -r /root/.pocketcoin/indexes
rm -r /root/.pocketcoin/pocketdb
wget https://snapshot.pocketnet.app/latest.tgz --no-check-certificate
tar -xzf latest.tgz -C ./

read -t 3 -p "rm latest.tgz"
rm /root/.pocketcoin/latest.tgz
read -t 3 -p "completed"

read -t 3 -p "starting node"
pocketcoind -daemon
