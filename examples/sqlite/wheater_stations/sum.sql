-- Find the SUM of precipitation by year when a tornado was present, and sort by year descending.

SELECT year, 
SUM(precipitation) as tornado_precipitation
FROM station_data
WHERE tornado = 1
GROUP BY year
ORDER BY year DESC
