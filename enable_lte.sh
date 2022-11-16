
#!/bin/bash


mmcli -i  /org/freedesktop/ModemManager1/SIM/0 --pin=0000 --disable-pin
#Setup Network Interface wwan0


#ifconfig wwan0
sudo ifconfig wwan0 up
sleep 3
sudo echo -e 'AT+CNMP=38\r' > /dev/ttyUSB2
sleep 3
sudo echo -e 'AT$QCRMCALL=1,1\r' > /dev/ttyUSB2
sleep 3
sudo dhclient -1 -v wwan0
