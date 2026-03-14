-- SELECT all records with report codes E6AED7, B950A1, 98DDAD

SELECT * FROM STATION_DATA
WHERE report_code IN ("E6AED7","B950A1","98DDAD")
