# Power supply for camera pod

Power is needed to run the camera and the RPi for a 5+ hour mission.

## Power requirements

### Sony Alpha 7s

Unlike many other cameras, the Sony a7 series can be powered by a USB powerbank and cable.

* The powerbank must be a "power delivery" (PD) model, capable of delivering at least 18W of power. Other powerbanks may seem work, but the internal battery and the external will be drained simultaneously and **the camera body can get very hot**. Testing is vital.
* Test the USB cable from power bank to camera - not all cables are made equal (by a long shot), and you may find that a good _data_ cable doesn't provide enough wattage to run the camera. In contrast, the uGreen cables used for fieldwork were poor for data but had excellent power capacity.

### Nikon

Normal EN-EL5a battery:
* nominally 7.4V 1kmAh -> 7.5Wh battery.
* Lasts for ~2,700 images

External power supplies:
* AC-DC easy to find on Amazon but require a 120 or 240VAC source.
* DC from USB powerbank and via the Tethertools connector and dummy battery.

## Power tests

2022 Bench testing

* Sony a74
* Powerology 10Ah powerbank
* 2s intervals.

~ 9h of operation until SD card filled up.

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

