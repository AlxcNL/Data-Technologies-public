# Partitioning – Breaking Large Tables into Smaller Pieces

````sql
CREATE TABLE sales (
    id SERIAL,
    sale_date DATE,
    amount NUMERIC
) PARTITION BY RANGE (sale_date);
`````

This partitions the sales table by date for optimized querying.