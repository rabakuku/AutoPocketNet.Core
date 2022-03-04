#!/bin/bash
echo "starting the installation"
pause 2s

echo "Installing the Ubuntu GUI"
pause 2s
sudo apt-get update && sudo apt-get upgrade -y

echo "Downloading and installing .deb"
pause 2s
wget https://github.com/pocketnetteam/pocketnet.core/releases/download/v0.20.18/pocketnetcore_0.20.18_linux_x64_setup.deb
sudo dpkg -i pocketnetcore_*_linux_x64_setup.deb

echo "Making the directories"
pause 2s
mkdir /root/.pocketcoin
mkdir /root/.pocketcoin/checkpoints
cd /root/.pocketcoin/checkpoints
wget https://github.com/pocketnetteam/pocketnet.core/releases/latest/download/main.sqlite3
cd ~

echo "downloading pocketcoin.conf"
wget https://raw.githubusercontent.com/rabakuku/AutoPocketNet.Core/main/pocketcoin.conf -O ~/.pocketcoin/pocketcoin.conf


echo "dowloading and unziping the blockchain"
pause 2s
cd /root/.pocketcoin
rm -r blocks
rm -r chainstate
rm -r indexes
rm -r pocketdb
wget https://snapshot.pocketnet.app/latest.tgz
tar -xzf latest.tgz -C ./

echo "rm latest.tgz"
pause 2s
rm /root/.pocketcoin/latest.tgz
echo "completed"
pause 2s

echo "starting node"
pause 2s
pocketcoind
