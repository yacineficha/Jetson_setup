#!/bin/bash



#Setup Network Interface wwan0


ifconfig wwan0
sudo ifconfig wwan0 up
echo -e 'AT+CNMP=2\r' > /dev/ttyUSB2
echo -e 'AT$QCRMCALL=1,1\r' > /dev/ttyUSB2
sudo dhclient -1 -v wwan0




#Installing as systemd service

git clone https://github.com/phillipdavidstearns/simcom_wwan-setup.git
cd simcom_wwan-setup
chmod +x install.sh uninstall.sh update.sh
sudo ./install.sh
sudo ./uninstall.sh
git pull; sudo ./update.sh
sudo systemctl enable simcom_wwan@wwan0.service
sudo systemctl start simcom_wwan@wwan0.service
sudo systemctl status simcom_wwan@wwan0.service

