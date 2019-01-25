# Power supply for camera pod

Power is needed to run the camera and the RPi for a 5+ hour mission.

## Power requirements

### Nikon

Normal EN-EL5a battery:
* nominally 7.4V 1kmAh -> 7.5Wh battery.
* Lasts for ~2,700 images

External power supplies:
* AC-DC (as per Lamprey) easy to find on Amazon;
* DC

## Power tests

2018-09-10 Bench test with full system
* Anker power supply ~ full
* CRelay on red (low power)
* D5600 JPG
* RPi running GPS script

Got 5 hours of actual operation; both GPS log and photos end at same time.

## Field tests

Units were powered with the Tethertools external battery connected to the Anker power supply by USB. 
* Power was enough for 5hr missions, using less than half the power indicated on the Anker.
* **Power failed** when the RPi was not also attached to the Anker and running. The unit would return having drained the Tethertools battery and the Anker still fully charged - apparently when the TetherTools unit stops drawing a certain current (i.e. when full or close to it?), the Anker would turn itself off and not resume. When the RPi was attached and drawing power, the Anker stayed on and powered both Pi and TT.