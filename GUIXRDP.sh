read -t 3 -p "Installing the Ubuntu GUI and Enabling XDRP"
sudo apt install xfce4 -y
sudo apt install xrdp -y
sudo adduser xrdp ssl-cert
sudo systemctl enable xrdp
sudo service xrdp stop
wget https://raw.githubusercontent.com/rabakuku/AutoPocketNet.Core/main/startwm.sh -O /etc/xrdp/startwm.sh
sudo service xrdp start
