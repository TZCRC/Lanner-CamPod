# OpenLog Artemis settings

The [Sparkfun OpenLog Artemis](https://www.sparkfun.com/products/19426) is a small board with integrated IMU[^1] and microSD card slot, which immediately starts logging data to the SD card when power is connected. It can be attached to a wide variety of sensors, including the GPS unit used here. 

Settings for logging camera pod IMU and GPS data using the Openlog Artemis (OLA) and the ublox ZOE-M8Q GPS unit with QWIIC connection.

To use, copy the two *.txt files to the SD card being used by the OLA, overwriting anything that was there before.

Settings:

* 10Hz logging speed.
* YYYYMMDD date-time format.
* GPS: log heading, ground speed.
* IMU QUAT6 quaternion values recorded.
* Log microseconds
* Log DMP compass

[^1]: As of late 2022 and early 2023, the version of the Artemis sold is **without the IMU** chip due to supply chain issues. However, there are QWIIC IMU board options available.