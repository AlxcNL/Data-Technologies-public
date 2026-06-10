-- https://github.com/thomasnield/oreilly_intermediate_sql_for_data/blob/master/intermediate_sql_class_notes.md

SELECT CUSTOMER_ORDER_ID, co.CUSTOMER_ID, ORDER_DATE, co.PRODUCT_ID, QUANTITY, ca.avg_qty
FROM CUSTOMER_ORDER AS co
INNER JOIN
(
    SELECT CUSTOMER_ID, PRODUCT_ID, AVG(QUANTITY) AS avg_qty
    FROM CUSTOMER_ORDER
    GROUP BY 1, 2
) AS ca
ON co.CUSTOMER_ID = ca.CUSTOMER_ID
AND co.PRODUCT_ID = ca.PRODUCT_ID

