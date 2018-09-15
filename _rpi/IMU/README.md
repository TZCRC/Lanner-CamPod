# IMU logging 

2018-09-15 Copied from BerryGPS repository and adapting.

to run: python berryIMU.py - will log to CSV file.

Generates about 100 lines per minute? Ends up being ~ 1MB per minute. Loop could probably be sped up a lot, is this necessary?

ToDo:

* Unique file name per run
* Set to run on boot
* Investigate SQLite vs CSV
