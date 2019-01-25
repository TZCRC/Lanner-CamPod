# Introduction

Setup of the RPi for use as logger system for SDE.

## Post-install

(This assumes SD card set up to connect to local wifi, accept SSH, and hardware attached) 

### Housekeeping

    ssh-copy-id pi@raspberrypi.local
	sudo hostname sde-X # Change X to whatever serial needed. MAY need to edit hosts file?
	sudo sed -i -e 's/raspberrypi/sde-X/g' /etc/hosts 
	sudo reboot

### Basic installs

	sudo passwd pi # then change to project password
	sudo apt update && sudo apt upgrade
	sudo apt install i2c-tools libi2c-dev python-smbus # for BerryIMU connection
	sudo apt install git
	
	sudo apt install python-pip
	sudo apt install python3-pip # For Py3 packages
	
### GPS setup:	
	
	sudo apt install gpsd gpsd-clients python-gps

(Set gpsd conf for /dev/ttyUSB0) # Note this was different for another USB GPS, instead using ttyAMA0. However this might be because of other /dev/tty* modifications for using the USB as a terminal connection?

	

Edit /etc/default/gpsd and update DEVICES and GPSD_OPTIONS. The following works for the GlobalSat BU, others need to be confirmed with `ls /dev/tty*` or `dmesg | grep tty` before and after plugging in.

	DEVICES="/dev/ttyUSB0"
	GPSD_OPTIONS="-n"
	

### GPS as time server
	
Edit `/etc/chrony/chrony.conf`, add the following line to the end of the file:

	refclock SHM 0 offset 0.5 delay 0.2 refid NMEA

After reboot, check if NMEA source is in use:

	chronyc sources -v

## Data setup

	sudo mkdir /sdedata	
	sudo chmod 777 /sdedata/
	
## Get code

	git clone https://github.com/TZCRC/SDE-CamPod.git
	
### Bluetooth setup

This isn't used at present, as we are waiting for code for Android connection.	
	
	sudo apt-get install libbluetooth-dev # Untested: needed for following?
	pip install pybluez # Python 2.7 bluetooth module

## Boot scripts

Add the following lines to rc.local - this will start the various scripts on boot. Not sure if the cron file is a better place for these?

Add logging option to see if anything goes wrong with the scripts:

	exec 1>/tmp/rc.local.log 2>&1  # send stdout and stderr from rc.local to a log file
	set -x

Start gpspipe logging to an nmea file:

	sudo gpspipe -r -d -l -o /sdedata/data.`date +"%Y%m%d%H%M%S"`.nmea
	
Start IMU script:
	
	python /home/pi/workspace/_github/SDE-CamPod/_rpi/IMU/berryIMU.py

## IMU setup

Use config utility `sudo raspi-config`, then select 

## Android connection 

2018-09-15 Work in progress - connection not set up yet.

	sudo bluetoothctl
	sudo echo "PRETTY_HOSTNAME=sde-X" > /etc/machine-info # Set a better name for Pi in BT broadcast.