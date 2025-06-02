# SQL Data Manipulation and Transactions
Structured Query Language (SQL) allows database manipulation using `INSERT`, `UPDATE`, and `DELETE` commands.
Data Manipulation Language (DML) allows modification of data in relational databases using:
- `INSERT` (add new records)
- `UPDATE` (modify existing records)
- `DELETE` (remove records)
  
Transactions ensure that database operations maintain consistency and integrity.


<br>

## 1. Inserting data

The `INSERT` statement is used to add new records to a table. The basic syntax is:

**Syntax:**
````sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
````

<br>

Using our **students** table as an example:

````sql
INSERT INTO students (id, first_name, last_name, date_of_birth, email, city, enrolled)
VALUES (1, 'John', 'Doe', '2000-05-15', 'john.doe@example.com', 'Amsterdam', '2025-09-01');
````

*This will add a **new student** with the specified values.*

<br>

#### Bulk insert
Bulk inserts are useful for importing data efficiently.
When using a bulk insert, we setup the fields and add multiple records seperated by a comma `,`.

````sql
INSERT INTO students (first_name, last_name, date_of_birth, email, city, enrolled)
VALUES 
    ('Alice', 'Smith', '2001-04-12', 'alice.smith@example.com', 'Amsterdam', '2025-09-01'),
    ('Bob', 'Brown', '2002-06-24', 'bob.brown@example.com', 'Utrecht', '2025-09-01'),
    ('Charlie', 'Taylor', '2000-12-19', 'charlie.taylor@example.com', 'Rotterdam', '2025-09-01');

````

This will insert 3 records at once and increases processing speed.

<br>

#### From another table
Sometimes you want to add a lot of data that is partially in another table, you can query that data while inserting rows dynamically based on conditions.

````sql
INSERT INTO enrollments (student_id, course_id, academic_year)
SELECT id, 3, 2025 FROM students WHERE city = 'Rotterdam';
````

This will insert students that are origination from `city = 'Rotterdam'` in the `enrollments` table for course_id `3` and academic_year `2025`.

<br>

#### CSV insert
Postgress has the composability of UNIX in it, this means that 

````sql
COPY students (first_name, last_name, date_of_birth, email, city, enrolled)
FROM '.\export\students.csv'
DELIMITER ','
CSV HEADER;
````

<br>

#### Try it yourself :rocket:
- Try to `INSERT` yourself as a student into the database.
- How about your teacher? Check if he/she is in the database and if not add them.

<br><br>

## 2. Updating data
The `UPDATE` statement is used to modify the existing records in a table.

**Syntax:**
````sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
````

**Example:**
````sql
UPDATE students
SET city = 'Amsterdam'
WHERE email = 'john.doe@example.com';
````
*This will update the `city` of all students matching `john.doe@example.com` to `'Amsterdam'`.*

> :warning: Be careful when updating records in a table! 
> Notice the `WHERE` clause in the `UPDATE` statement. The `WHERE` clause specifies which record(s) that should be updated. 
> **If you omit the `WHERE` clause, ALL records in the table will be updated!**

<br>

#### Updating multiple rows based on conditions
In the above example we showed how to update based on a condition, an email is in most condition an unique field for a student, but if we use a condition that is much wider in range this will also work.

````sql
UPDATE students
SET city = 'The Hague'
WHERE city = 'Rotterdam';
```` 
*This will update the `city` of all students to `'The Hague'` currently living in `'Rotterdam'`.*

<br>

#### Updating multiple columns at once
Up until now we just update a single column in our database table, but in most cases we want to update multiple columns of a record that matches our condition.

*It is the `WHERE` clause that determines how many records will be updated.*

````sql
UPDATE courses
SET department = 'Data Science', credits = 6
WHERE name = 'Database Systems';
```` 
*This will update the `city` of all students to `'The Hague'` currently living in `'Rotterdam'`.*

<br>

#### Updating using data from another table
````sql
UPDATE students
SET enrolled = '2025-09-01'
WHERE id IN (SELECT student_id FROM enrollments WHERE academic_year = 2025);
````

<br>

#### *:warning: Update warning!*
Be careful when updating records. If you omit the `WHERE` clause, ALL records will be updated!

<br>

#### Try it yourself :rocket:
- Search all students that live in `'Losser'`, how many students are there?
- Update these students to now live in `'Lutjebroek'`
- Update your own enrollment year in the database to be `'01-09-2025'`

<br><br>

## 3. Deleting data
The `DELETE` statement is used to delete existing records in a table.

**Syntax:**
````sql
DELETE FROM table_name WHERE condition;
````

**Example:**
````sql
DELETE FROM students
WHERE email = 'john.doe@example.com';
````
*This will delete all students with email `'john.doe@example.com'`.*
<br>

> :warning: Be careful when deleting records in a table! 
> Notice the `WHERE` clause in the `DELETE` statement. The `WHERE` clause specifies which record(s) that should be deleted. 
> **If you omit the `WHERE` clause, ALL records in the table will be deleted!**

<br>

#### Deleting multiple rows based on a condition
````sql
DELETE FROM enrollments
WHERE academic_year < 2020;
````

<br>

#### Deleting data using subqueries
````sql
DELETE FROM enrollments
WHERE student_id IN (SELECT id FROM students WHERE city = 'Amsterdam');
````

<br>

#### *:warning: Delete warning!*
Be careful when deleting records. If you omit the `WHERE` clause, ALL records will be deleted!

<br>

#### Try it yourself :rocket:
- Try deleting all students that live in `'Lutjebroek'`, 
make sure that all records belonging with this student inside other tables are also deleted.

<br><br>

## 4. Transactions
Transactions in SQL are crucial for ensuring the integrity and consistency of a database, especially in scenarios where multiple related changes need to be executed together. A transaction is a sequence of operations performed as a single logical unit of work, which follows the ACID properties:

1. **Atomicity** - Ensures that all operations in a transaction are completed; otherwise, none of them are applied.
2. **Consistency** - Guarantees that the database remains in a valid state before and after the transaction.
3. **Isolation** - Ensures transactions execute independently without interfering with each other.
4. **Durability** - Persists the effects of a successful transaction permanently.

<br>

#### Transaction control
Following are the few commands that control transactions:
- **BEGIN TRANSACTION** - will start a transaction *(SQL native equivalent = `START TRANSACTION`)*
- **COMMIT** − To save the changes, alternatively you can use **END TRANSACTION** command.
- **ROLLBACK** − To rollback the changes

> *Transactional control commands are only used with the commands `INSERT`, `UPDATE` and `DELETE`*. 
> *They cannot be used while creating tables or dropping them because these operations are automatically committed in the database.*

<br>

#### `BEGIN TRANSACTION` command
Transactions can be started using the `BEGIN TRANSACTION` or shorthand `BEGIN` command. 
*(SQL native equivalent is `START TRANSACTION` or `START`), examples are all in PostgreSQL syntax*.
A transaction usually persists until the next `COMMIT` or `ROLLBACK` command is encountered. 
Transactions will also `ROLLBACK` if the database is closed in between or if an error occurs before the transaction is finished.

**Syntax**
````sql
BEGIN;

or

BEGIN TRANSACTION;
````

<br>

#### `COMMIT` command
The `COMMIT` command is the transactional command used to save changes invoked by a transaction to the database.
It will save all transactions tot the database since the last `COMMIT` or `ROLLBACK` command.

**Syntax**
````sql
COMMIT;

or

END TRANSACTION;
````

<br>

#### `ROLLBACK` command
The `ROLLBACK` command is the transactional command used to undo the transactions that have not already been saved to the database.
It can only be used to undo transactions since the last `COMMIT` or `ROLLBACK` command.

**Syntax**
````sql
ROLLBACK;
````

<br>

### Examples

#### Enrolling a Student in a Course
When enrolling a student in a course, you might need to insert data into the enrollments table and potentially update other related records.
````sql
BEGIN TRANSACTION;

INSERT INTO enrollments (student_id, course_id, academic_year)
VALUES (1, 3, 2025);

-- Ensure course is active before enrolling students
IF EXISTS (SELECT * FROM courses WHERE id = 3 AND active = FALSE) THEN
    ROLLBACK;
    PRINT 'Transaction rolled back: Course is not active.';
ELSE
    COMMIT;
    PRINT 'Transaction committed: Enrollment successful.';
END IF;
````
*Transactions prevent errors like enrolling students in inactive courses.*

<br>


#### Transaction with multiple operations
````sql
BEGIN TRANSACTION;

-- Bulk enrollment of students into a course
INSERT INTO enrollments (student_id, course_id, academic_year)
SELECT id, 3, 2025 FROM students WHERE city = 'Rotterdam';

-- Activate course before enrolling
UPDATE courses SET active = TRUE WHERE id = 3;

-- Check for errors before committing
IF NOT EXISTS (SELECT * FROM courses WHERE id = 3 AND active = TRUE) THEN
    ROLLBACK;
    PRINT 'Transaction failed: Course activation error.';
ELSE
    COMMIT;
    PRINT 'Transaction successful: Students enrolled.';
END IF;
````
*Transactions help maintain database integrity.*

<br>

#### Transaction with savepoint
Savepoints allow partial rollbacks witihin a transaction
````sql
BEGIN TRANSACTION;

-- Enroll student
INSERT INTO enrollments (student_id, course_id, academic_year)
VALUES (1, 3, 2025);

SAVEPOINT enrollment_saved;

-- Insert result
INSERT INTO results (enrollment_id, grade)
VALUES (1, 'A');

-- Something goes wrong, rollback only results insert
ROLLBACK TO enrollment_saved;

COMMIT;
````
:warning: *Rolling back to a savepoint **does not** end the transaction; you can continue executing further commands after a rollback.*

<br>

You can **release** a savepoint when it's no longer needed via:
````sql
RELEASE SAVEPOINT enrollment_saved;
````




<br>

### Isolation levels
SQL provides isolation levels to handle concurrent transactions safely:

- **READ UNCOMMITTED**: Allows dirty reads (uncommitted data).
- **READ COMMITTED**: Prevents dirty reads but allows non-repeatable reads.
- **REPEATABLE READ**: Prevents dirty and non-repeatable reads.
- **SERIALIZABLE**: Ensures full isolation, avoiding phantom reads.

You can set the isolation level like this:
````sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
````
<br>

### Best practices
- Use transactions when modifying multiple related records. 
- Always test updates and deletions on sample data before applying to live data.
- Use bulk operations for efficient insertions and updates. 
- Regularly backup your database before making structural changes.

<br>
