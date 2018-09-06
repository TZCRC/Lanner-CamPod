## IMU notes

### BNO055 Adafruit

Setting up serial port problematic - see:

https://raspberrypi.stackexchange.com/questions/47671/why-my-program-wont-communicate-through-ttyama0-on-raspbian-jessie

Register read error fixed after:

sudo systemctl mask serial-getty@ttyAMA0.service

and changing cmdline.txt to:

dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait
