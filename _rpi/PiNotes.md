# Introduction

Setup of the RPi for use as logger system for SDE.

## Post-install

sudo passwd pi # then change to asdf098
sudo hostname sde-X # Change X to whatever serial needed.
sudo apt update 
sudo apt upgrade
sudo apt install python3-pip
pip3 install pybluez