# Stored Procedures & Triggers

Why use stored procedures? Automating operations.

Triggers: Executing actions based on table changes.

Examples: Auto-generate academic year upon enrollment.

Example SQL Trigger:
```sql
CREATE TRIGGER update_academic_year
BEFORE INSERT ON enrollments
FOR EACH ROW
EXECUTE FUNCTION set_academic_year();
```