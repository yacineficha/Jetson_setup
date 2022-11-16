#!/bin/bash

sudo apt install python3-pip
python3 -m pip install --upgrade pip
sudo apt-get install nano
sudo apt-get install dos2unix

#Install ffmpeg

python3 -m pip install ffmpeg-python

#downgrade OpenCV to 1.19.4

#Install Remoteit
#sudo wget https://downloads.remote.it/remoteit/v4.14.1/remoteit-4.14.1.arm64.deb

#Colne git



cd /home/ficha

git clone https://github.com/yacineficha/Truck-code.git
cd Truck-code
cp -r ./* /home/ficha/
cd /home/ficha
sudo cp run_service.service /lib/systemd/system/
sudo cp lte_network.service /lib/systemd/system/

sudo chmod 777 ./run.sh
sudo chmod +x start_service.sh

python3 -m pip install progress
sudo apt purge numpy

sudo python3 -m pip install numpy

sudo apt install python3-pip
pip3 install gps

#sudo chmod u+x install.sh
