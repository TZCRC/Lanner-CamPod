import bluetooth
from time import sleep

import RPi.GPIO as GPIO

print "\n"

SERVER_INFO = (GPIO.RPI_INFO)

print "\n"

print "*********Welcome to TurnMeOnPiServer********** \n"

print "************** SERVER INFORMATION *************\n"

print 'Pi Revision   : ',SERVER_INFO['P1_REVISION'], "\n"
print 'Amount of RAM : ',SERVER_INFO['RAM'], "\n"
print 'Revision      : ',SERVER_INFO['REVISION'], "\n"
print 'Pi Type       : ',SERVER_INFO['TYPE'], "\n"
print 'Processor     : ',SERVER_INFO['PROCESSOR'], "\n"
print 'Manufacturer  : ',SERVER_INFO['REVISION'], "\n"

print 'Waiting for connection!\n'

LED=21

GPIO.setmode(GPIO.BCM)  #programming the GPIO by BCM pin numbers. (like PIN40 as GPIO21)
GPIO.setwarnings(False)
GPIO.setup(LED,GPIO.OUT) #initialize (LED) as an output Pin
GPIO.output(LED,0)

server_socket=bluetooth.BluetoothSocket(bluetooth.RFCOMM)

port = 1
server_socket.bind(("",port))
server_socket.listen(1)

client_socket,address = server_socket.accept()
print "Accepted connection from ", address

while 1:
	data = client_socket.recv(1024)
	print "Received: %s" % data
	if(data == "0"): #if '0' is sent from the Android App, turn OFF the LED
		print ("GPIO 21 LOW, LED OFF")
		GPIO.output(LED,0)
		data = "LED OFF!!"
	if (data == "1"): #if '1' is sent from the Android App, turn OFF the LED
		print("GPIO 21 HIGH, LED ON")
		GPIO.output(LED,1)
		data = "LED ON!!"
	if (data == "q"):
		data = "Quiting the APP!!"
		print("Quit")
		
		GPIO.cleanup()
		break
	client_socket.send(data)

client_socket.close()
server_socket.close()