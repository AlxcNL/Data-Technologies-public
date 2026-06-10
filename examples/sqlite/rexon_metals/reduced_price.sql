-- SELECT the product_id, description, and a reduced_price (which subtracts $1.10 from each price) from the product table

SELECT product_id, description, (price - 1.10) AS reduced_price
FROM product;
