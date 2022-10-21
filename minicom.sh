
#!/bin/bash

# Software Setup

#sudo apt-get update
#sudo apt-get install p7zip python3-serial minicom Jetson.GPIO -y
#wget https://www.waveshare.com/w/upload/9/9b/SIM7600X_4G_for_JETSON_NANO.7z
#p7zip --uncompress SIM7600X_4G_for_JETSON_NANO.7z



sudo apt-get update
sudo apt-get install python3-pip
sudo pip3 install pyserial
mkdir -p ~/Documents/SIM7600X_4G_for_JETSON_NANO
wget -P ~/Documents/SIM7600X_4G_for_JETSON_NANO/ https://www.waveshare.com/w/upload/6/64/SIM7600X_4G_for_JETSON_NANO.tar.gz
cd ~/Documents/SIM7600X_4G_for_JETSON_NANO/
tar -xvf SIM7600X_4G_for_JETSON_NANO.tar.gz
sudo pip3 install Jetson.GPIO
sudo groupadd -f -r gpio
sudo usermod -a -G gpio your_user_name
sudo udevadm control --reload-rules && sudo udevadm trigger
sudo apt-get install minicom


#Enable the Hardware (only necessary for testing before the kernel module is installed)

echo 200 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio200/direction
echo 1 > /sys/class/gpio/gpio200/value
echo 0 > /sys/class/gpio/gpio200/value


#Testing

#sudo minicom -s

# 1- Arrow down to Modem and Dialing and press enter
# 2- Remove "Dialing prefix", "Dialing suffix", and "Hang-up string" entries to match:
# 3- Escape to the configuration menu
# 4- Select Screen and keyboard and press enter.
# 5- Press q to toggle Local echo to Yes
# 6- Escape to the configuration menu
# 7- Select Save setup as dfl and press enter
# 8- Select Exit from Minicom and press enter


#On To Testing

sudo minicom -D /dev/ttyUSB2

# Enter ATI
# If you can't see your local echo, you may need to enable it:
# Press ctrl+a then z to bring up the options menu.
# Press e to enable echo
# esc to return to the console
