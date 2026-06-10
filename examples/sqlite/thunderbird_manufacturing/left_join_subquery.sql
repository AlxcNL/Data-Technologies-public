-- https://github.com/thomasnield/oreilly_intermediate_sql_for_data/blob/master/intermediate_sql_class_notes.md
SELECT CALENDAR_DATE, all_combos.PRODUCT_ID, TOTAL_QTY
FROM
(
  SELECT CALENDAR_DATE, PRODUCT_ID
  FROM PRODUCT
  CROSS JOIN CALENDAR
  WHERE CALENDAR_DATE BETWEEN '2017-01-01' and '2017-03-31'
) AS all_combos
LEFT JOIN
(
  SELECT ORDER_DATE, PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QTY
  FROM CUSTOMER_ORDER
  GROUP BY ORDER_DATE, PRODUCT_ID
) AS totals
ON all_combos.CALENDAR_DATE = totals.ORDER_DATE
AND all_combos.PRODUCT_ID = totals.PRODUCT_ID
ORDER BY CALENDAR_DATE, all_combos.PRODUCT_ID