name = 'test.csv'

import csv   
import datetime

fields=['first','second','third']
with open(name, 'a') as f:
	writer = csv.writer(f)
	writer.writerow(fields)
	
while True:
	values = [datetime.datetime.now(), 2, 3]
	with open(name, 'a') as f:
		writer = csv.writer(f)
		writer.writerow(values)
		
