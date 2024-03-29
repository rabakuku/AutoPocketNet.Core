read -t 3 -p "Stopping old version"
pocketcoin-cli stop

read -t 90 -p "Deleting old version"
rm pocketnetcore_0*

read -t 4 -p "Downloading and installing new version"
wget https://github.com/pocketnetteam/pocketnet.core/releases/download/v0.20.25/pocketnetcore_0.20.25_linux_x64_setup.deb --no-check-certificate
sudo dpkg -i pocketnetcore_*_linux_x64_setup.deb


read -t 15 -p "starting daemon with new version"
pocketcoind -daemon

read -t 300 -p "verifying it is running"
pocketcoin-cli getstakinginfo
