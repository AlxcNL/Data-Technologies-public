# Database Security & Access Control

User roles (GRANT, REVOKE)

Authentication and permissions

Row-level security (RLS) in PostgreSQL.

Example SQL:
```sql
GRANT SELECT ON students TO teacher_role;
REVOKE DELETE ON students FROM student_role;
```