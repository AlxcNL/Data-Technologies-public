-- Get all orders on the last day there were orders

SELECT * FROM CUSTOMER_ORDER
WHERE ORDER_DATE = (
	SELECT MAX(ORDER_DATE)
	FROM CUSTOMER_ORDER
)