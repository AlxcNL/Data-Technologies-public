# Indexing – Speeding Up Data Retrieval

````sql
CREATE INDEX idx_employee_salary ON employees USING BRIN (salary);
`````

Creates a Block Range Index (BRIN), which is efficient for large datasets.
