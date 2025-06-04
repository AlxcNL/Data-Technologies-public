# Materialized Views – Precomputing expensive queries

````sql
CREATE MATERIALIZED VIEW top_sellers AS
SELECT name, SUM(sales) FROM employees GROUP BY name;
````

Materialized views store precomputed results, making retrieval faster.