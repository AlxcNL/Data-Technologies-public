#!/usr/bin/env python3

import csv

with open('science-planet-data.csv', mode ='r') as file:
  csvFile = csv.reader(file)

  for row in csvFile:
      print('INSERT INTO planets(names, classes, mark )' 'VALUES("%s", "%s", "%s")', row)
