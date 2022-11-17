#!/bin/bash



#Setup Network Interface wwan0


cd simcom_wwan
sudo make clean
sleep 2
sudo make
sleep 2
sudo make install
sleep 2
#sudo make install ./simcom*.* /lib/modules/4.9.140-tegra #on the latest image release if the above fails.
sudo depmod
sudo modprobe -v simcom_wwan
sudo lsmod #Check for simcom_wwan to confirm successful installation 
sudo dmesg | grep simcom #Check kernel messages for successful installation
