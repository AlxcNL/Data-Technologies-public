# Relationships Between Tables

Why Are Relationships Important?
Reduce redundancy (normalize data properly).

Improve data integrity (enforce constraints like FOREIGN KEY).

Enable powerful queries (joining data across multiple tables).

### Types of Table Relationships

#### One-to-One (1:1) Relationship
    Example: Students & IDs (Each student has exactly one unique ID card).

    SQL Example:

    ```sql
    CREATE TABLE student_ids (
        student_id INT PRIMARY KEY REFERENCES students(id),
        card_number VARCHAR(20) UNIQUE NOT NULL
    );
    ```

<br>

#### One-to-Many (1:N) Relationship
Example: Students & Enrollments (One student enrolls in many courses).

SQL Example:
```sql
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    academic_year INT NOT NULL
);
```
<br>

#### Many-to-Many (M:N) Relationship
Example: Teachers & Courses (A teacher teaches multiple courses, and each course can have multiple teachers).

Requires a junction table (course_teachers):
```sql
CREATE TABLE course_teachers (
    course_id INT REFERENCES courses(id),
    teacher_id INT REFERENCES teachers(id),
    academic_year INT NOT NULL,
    PRIMARY KEY (course_id, teacher_id, academic_year)
);
```

#### Querying Relationships in Practice
Joining Students and Courses via Enrollments
```sql
SELECT s.first_name, s.last_name, c.name AS course_name, e.academic_year
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id;
```
Connects students to courses using the enrollments table.