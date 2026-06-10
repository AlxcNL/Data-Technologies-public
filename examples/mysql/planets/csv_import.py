#!/usr/bin/env python3

import csv

csvPath = "../../data/planets.csv"
sqlPath = "insert_data.sql"

with open(sqlPath, "w") as sqlFile:

  print("USE space;", file=sqlFile)

  print("DELETE FROM planets;\n", file=sqlFile)

  with open(csvPath, mode ='r') as csvFile:
    csvReader = csv.reader(csvFile)

    header = next(csvReader)

    for row in csvReader:
      print(f'INSERT INTO planets ({header[0]}, {header[1]})', file=sqlFile) 
      print(f"VALUES ('{row[0]}', '{row[1]}');\n", file=sqlFile)
    
