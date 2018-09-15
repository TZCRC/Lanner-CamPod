# Introduction

Setup of the RPi for use as logger system for SDE.

## Post-install

	sudo passwd pi # then change to project password
	sudo hostname sde-X # Change X to whatever serial needed.
	sudo apt update 
	sudo apt upgrade
	sudo apt install i2c-tools libi2c-dev python-smbus # for BerryIMU connection
	sudo apt install git
	sudo apt install gpsd gpsd-clients python-gps
	sudo apt install python3-pip # For Py3 packages
	pip install pybluez # Python 2.7 bluetooth module

    ssh-copy-id pi@raspberrypi.local 


## Android connection 

sudo bluetoothctl

sudo echo "PRETTY_HOSTNAME=sde-X" > /etc/machine-info # Set a better name for Pi in BT broadcast.