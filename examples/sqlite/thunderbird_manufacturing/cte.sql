-- https://github.com/thomasnield/oreilly_intermediate_sql_for_data/blob/master/intermediate_sql_class_notes.md

WITH CUST_AVGS AS (
    SELECT CUSTOMER_ID, PRODUCT_ID, AVG(QUANTITY) AS AVG_QTY
    FROM CUSTOMER_ORDER
    GROUP BY 1, 2
)

SELECT CUSTOMER_ORDER_ID, co.CUSTOMER_ID, ORDER_DATE, co.PRODUCT_ID, QUANTITY,  AVG_QTY
FROM CUSTOMER_ORDER AS co
INNER JOIN CUST_AVGS AS ca
ON co.CUSTOMER_ID = ca.CUSTOMER_ID
AND co.PRODUCT_ID = ca.PRODUCT_ID