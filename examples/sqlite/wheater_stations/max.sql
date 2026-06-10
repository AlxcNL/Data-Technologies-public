-- SELECT the year and max snow depth, but only years where the max snow depth is at least 50.

SELECT year, 
max(snow_depth) AS max_snow_depth
FROM STATION_DATA
GROUP BY year
HAVING max_snow_depth >= 50
