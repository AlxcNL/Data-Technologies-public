-- https://github.com/thomasnield/oreilly_intermediate_sql_for_data/blob/master/intermediate_sql_class_notes.md

SELECT e1.FIRST_NAME, e1.LAST_NAME, e1.TITLE, e2.FIRST_NAME AS MANAGER_FIRST_NAME, e2.LAST_NAME AS MANAGER_LAST_NAME
FROM EMPLOYEE e1 INNER JOIN EMPLOYEE e2
ON e1.MANAGER_ID = e2.ID
WHERE e1.FIRST_NAME = 'Daniel'