read -t 3 -p "Stopping old version"
pocketcoin-cli stop

read -t 3 -p "Deleting old version"
rm pocketnetcore_0*

read -t 20 -p "Downloading and installing new version"
wget https://github.com/pocketnetteam/pocketnet.core/releases/download/v0.20.20/pocketnetcore_0.20.20_linux_x64_setup.deb --no-check-certificate
sudo dpkg -i pocketnetcore_*_linux_x64_setup.deb


read -t 30 -p "starting daemon with new version"
pocketcoind -daemon

read -t 40 -p "verifying it is running"
pocketcoin-cli getstakinginfo
