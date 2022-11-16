#1- Install Remoteit

sudo su


sudo apt-get update
sudo apt-get upgrade

sudo wget https://downloads.remote.it/remoteit/v4.14.1/remoteit-4.14.1.arm64.deb
sudo wget https://downloads.remote.it/remoteit/v4.15.3/remoteit-4.15.3.arm64.deb
sudo apt-get install ./remot...

git clone https://github.com/yacineficha/Jetson_setup.git
cd Jetson_setup



sudo apt-get install dos2unix
dos2unix install.sh start_lte.sh stop.sh minicom.sh 4G_connection.sh enable_hardware.sh
sudo chmod u+x install.sh start_lte.sh stop.sh minicom.sh 4G_connection.sh enable_hardware.sh
cp -r ./* /home/ficha/


1- install.sh

Cam configuration Setup the PI HQ 2018 v1 camera on the jeton nano (IMX 477)

https://www.arducam.com/docs/camera-for-jetson-nano/jetson-nano-xavier-nx-configuring-the-csi-connector-w-jetson-io/
cat /etc/nv_tegra_release
sudo /opt/nvidia/jetson-io/jetson-io.py


2- minicom.sh


5- Testing

Setting up minicom
NOTE: It's also possible (and possibly easier) to use screen. If you don't have time to deal with this, skip to the "Pure bash shell" instructions at the end of this section.

At this point, the instructions provided by Waveshare call for using minicom, but don't provide any hint that it needs to be setup. Instructions for setup can be found here and are summarized below.

$ sudo minicom -s will greet you with a configuration menu

            +-----[configuration]------+
            | Filenames and paths      |
            | File transfer protocols  |
            | Serial port setup        |
            | Modem and dialing        |
            | Screen and keyboard      |
            | Save setup as dfl        |
            | Save setup as..          |
            | Exit                     |
            | Exit from Minicom        |
            +--------------------------+

Arrow down to Modem and Dialing and press enter
Remove "Dialing prefix", "Dialing suffix", and "Hang-up string" entries to match:

 +--------------------[Modem and dialing parameter setup]---------------------+
 |                                                                            |
 | A - Init string .........                                                  |
 | B - Reset string ........                                                  |
 | C - Dialing prefix #1....                                                  |
 | D - Dialing suffix #1....                                                  |
 | E - Dialing prefix #2....                                                  |
 | F - Dialing suffix #2....                                                  |
 | G - Dialing prefix #3....                                                  |
 | H - Dialing suffix #3....                                                  |
 | I - Connect string ...... CONNECT                                          |
 | J - No connect strings .. NO CARRIER            BUSY                       |
 |                           NO DIALTONE           VOICE                      |
 | K - Hang-up string ......                                                  |
 | L - Dial cancel string .. ^M                                               |
 |                                                                            |
 | M - Dial time ........... 45      Q - Auto bps detect ..... No             |
 | N - Delay before redial . 2       R - Modem has DCD line .. Yes            |
 | O - Number of tries ..... 10      S - Status line shows ... DTE speed      |
 | P - DTR drop time (0=no). 1       T - Multi-line untag .... No             |
 |                                                                            |
 | Change which setting?     Return or Esc to exit. Edit A+B to get defaults. |
 +----------------------------------------------------------------------------+
 
Escape to the configuration menu
Select Screen and keyboard and press enter.
Press q to toggle Local echo to Yes
Escape to the configuration menu
Select Save setup as dfl and press enter
Select Exit from Minicom and press enter

On To Testing

AT COMMANDE :

sim ready?
AT+CPIN?
Network available?
AT+COPS?
Network quality
AT+CSQ
LTE Dialling
AT+CNMP?
AT+CNMP=?
AT+CNMP=2 FOR Automatic mode
AT+CNMP=38 FOR just LTE mode


AT+CREG : AT command gives information about the registration status and access technology of the serving cell.


7- enable_hardware.sh

mmcli -i  /org/freedesktop/ModemManager1/SIM/0 --pin=0000 --disable-pin

8- To make sure the Jetson Nano loads the simcom_wwan kernel module driver:

sudo nano /etc/modules-load.d/modules.conf
Add simcom_wwan to this file if it's not already there.
Ctrl-X, Y, Enter (Save and close)

9- To make the sim_comwwan@wwan0 service wait for the USB device:


sudo nano /etc/udev/rules.d/99-usb-4g.rules
Add the line: SUBSYSTEM=="tty", KERNEL=="ttyUSB2", TAG+="systemd", ENV{SYSTEMD_WANTS}+="simcom_wwan@wwan0.service"
Ctrl-X, Y, Enter (Save and close)

10- OpenCV installation instructions

nano ~/.bashrc
add at the bottom of the file the following line :
export OPENBLAS_CORETYPE=ARMV8

11- Test the changes
sudo reboot

