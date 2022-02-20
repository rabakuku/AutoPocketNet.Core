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
mkdir ~/.pocketcoin
mkdir ~/.pocketcoin/checkpoints
cd ~/.pocketcoin/checkpoints
wget https://github.com/pocketnetteam/pocketnet.core/releases/latest/download/main.sqlite3
cd ~

echo "dowloading and unziping the blockchain"
pause 2s

cd ~/.pocketcoin
rm -r blocks
rm -r chainstate
rm -r indexes
rm -r pocketdb
wget https://snapshot.pocketnet.app/latest.tgz
tar -xzf latest.tgz -C ./

echo "completed"
pause 2s
