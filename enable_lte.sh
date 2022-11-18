
#!/bin/bash


#Setup Network Interface wwan0


#ifconfig wwan0
sudo ifconfig wwan0 up
sleep 3
sudo echo -e 'AT+CNMP=38\r' > /dev/ttyUSB2
sleep 3
sudo echo -e 'AT$QCRMCALL=1,1\r' > /dev/ttyUSB2
sleep 3
sudo dhclient -1 -v wwan0
