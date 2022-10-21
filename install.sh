#!/bin/bash

sudo su
sudo apt update
sudo apt upgrade
sudo apt install python3-pip
python3 -m pip install --upgrade pip
sudo apt install nano

#Install ffmpeg

python3 -m pip install ffmpeg-python

#downgrade OpenCV to 1.19.4

#Install Remoteit
#sudo wget https://downloads.remote.it/remoteit/v4.14.1/remoteit-4.14.1.arm64.deb

#Colne git

git clone https://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@github.com/Ficha-Dev/Truck-Jetson-video.git

cd Truck-Jetson-video
cp -r ./* /home/ficha/
cd /home/ficha
sudo cp run_service.service /lib/systemd/system/
sudo chmod 777 ./run.sh
sudo chmod +x start_service.sh

python3 -m pip install progress
sudo apt purge numpy

sudo python3 -m pip install numpy

sudo apt install python3-pip
pip3 install gps

#sudo chmod u+x install.sh
