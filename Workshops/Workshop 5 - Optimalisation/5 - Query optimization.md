# Query Optimization – Writing Efficient SQL

Some first raw thougts:

- Select explicit columns (not *)
- upserts

# Optimizing Inserts and Updates with Upserts  

## Context
We want to store **page view counts** per URL per hour.  

```sql
CREATE TABLE page_views (
    url TEXT NOT NULL,
    time_bucket TIMESTAMP NOT NULL,
    views INT NOT NULL,
    PRIMARY KEY (url, time_bucket)
);
```

A web application reports one “page view” at a time. For each `(url, time_bucket)` combination, we need to increase the counter.  

---

## Part 1 — Naïve approach (without upsert)

**Step 1.** Insert some sample data:  

```sql
INSERT INTO page_views (url, time_bucket, views)
VALUES ('/home', '2025-09-04 10:00', 5);
```

**Step 2.** Now add a new page view for the same `(url, time_bucket)`.  
The naïve approach requires multiple steps:

```sql
-- Step 2a: Check if record exists
SELECT views FROM page_views
WHERE url = '/home' AND time_bucket = '2025-09-04 10:00';

-- Step 2b: If record exists → update
UPDATE page_views
SET views = views + 1
WHERE url = '/home' AND time_bucket = '2025-09-04 10:00';

-- Step 2c: If record does not exist → insert
INSERT INTO page_views (url, time_bucket, views)
VALUES ('/home', '2025-09-04 10:00', 1);
```

👉 **Problems:**  
- Multiple queries per insert.  
- Risk of race conditions if many clients update at the same time.  
- Higher latency.  

---

## Part 2 — Upsert (PostgreSQL)

Postgres provides a single statement that does both **insert** and **update**:

```sql
INSERT INTO page_views (url, time_bucket, views)
VALUES ('/home', '2025-09-04 10:00', 1)
ON CONFLICT (url, time_bucket)
DO UPDATE SET views = page_views.views + EXCLUDED.views;
```

- If the record does not exist → a new row is inserted.  
- If the record exists → it is updated (`page_views.views + EXCLUDED.views`). The `page_views.views` refers to the current `views` and the `EXCLUDED.views` to the new views you tried to insert. 

👉 **Advantages:**  
- One query instead of multiple.  
- Atomic and concurrency-safe.  
- Fewer roundtrips → better performance.  


A similar syntax also exists for MySQL and MariaDB.

https://dev.mysql.com/doc/refman/8.4/en/insert-on-duplicate.html
https://mariadb.com/docs/server/reference/sql-statements/data-manipulation/inserting-loading-data/insert-on-duplicate-key-update
https://www.postgresql.org/docs/current/sql-insert.html

---

## Reflection questions

- Why is the upsert approach more efficient?  
- How does it help prevent race conditions?  
- Can you think of situations where you **should not** use upserts?  
---

