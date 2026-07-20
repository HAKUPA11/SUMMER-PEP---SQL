-- ============================================================
-- MODULE 4 : TABLES
-- ============================================================

-- ------------------------------------------------------------
-- 1. What is a Table?
-- ------------------------------------------------------------
-- A table is a collection of related data organized into
-- rows and columns.
--
-- Row (Record)    -> Represents one complete entry.
-- Column (Field)  -> Represents one attribute of the data.
--
-- Example:
--
-- +----+---------+-----+
-- | id | name    | age |
-- +----+---------+-----+
-- | 1  | Harsh   | 20  |
-- | 2  | Rahul   | 21  |
-- +----+---------+-----+

-- ------------------------------------------------------------
-- 2. CREATE TABLE
-- ------------------------------------------------------------
-- Used to create a new table.
--
-- Syntax:
--
-- CREATE TABLE table_name(
--     column_name data_type,
--     column_name data_type,
--     ...
-- );

CREATE TABLE students(
    id INT,
    name VARCHAR(50),
    age INT
);

-- ------------------------------------------------------------
-- 3. SHOW TABLES
-- ------------------------------------------------------------
-- Displays all tables present in the current database.

SHOW TABLES;

-- ------------------------------------------------------------
-- 4. DESCRIBE TABLE
-- ------------------------------------------------------------
-- Displays the structure of a table.

DESCRIBE students;

-- OR

DESC students;

-- ------------------------------------------------------------
-- 5. SHOW CREATE TABLE
-- ------------------------------------------------------------
-- Displays the SQL statement used to create a table.

SHOW CREATE TABLE students;

-- ------------------------------------------------------------
-- 6. ALTER TABLE
-- ------------------------------------------------------------
-- Used to modify an existing table.

-- ------------------------------------------------------------
-- Add a new column

ALTER TABLE students
ADD email VARCHAR(100);

-- ------------------------------------------------------------
-- Add multiple columns

ALTER TABLE students
ADD city VARCHAR(50),
ADD phone VARCHAR(15);

-- ------------------------------------------------------------
-- Modify the data type of a column

ALTER TABLE students
MODIFY age SMALLINT;

-- ------------------------------------------------------------
-- Rename a column (MySQL 8.0+)

ALTER TABLE students
RENAME COLUMN phone TO mobile;

-- ------------------------------------------------------------
-- Change both name and datatype

ALTER TABLE students
CHANGE mobile mobile_number VARCHAR(20);

-- ------------------------------------------------------------
-- Drop a column

ALTER TABLE students
DROP COLUMN city;

-- ------------------------------------------------------------
-- 7. RENAME TABLE
-- ------------------------------------------------------------
-- Used to rename a table.

RENAME TABLE students TO student_details;

-- Rename it back

RENAME TABLE student_details TO students;

-- ------------------------------------------------------------
-- 8. TRUNCATE TABLE
-- ------------------------------------------------------------
-- Removes all rows from a table.
--
-- Table structure remains.
-- Faster than DELETE.

TRUNCATE TABLE students;

-- ------------------------------------------------------------
-- 9. DROP TABLE
-- ------------------------------------------------------------
-- Permanently deletes the table and all its data.

-- Example:
-- DROP TABLE students;

-- ------------------------------------------------------------
-- 10. IF EXISTS
-- ------------------------------------------------------------
-- Prevents an error if the table does not exist.

DROP TABLE IF EXISTS students;

-- ------------------------------------------------------------
-- 11. IF NOT EXISTS
-- ------------------------------------------------------------
-- Prevents an error if the table already exists.

CREATE TABLE IF NOT EXISTS students(
    id INT,
    name VARCHAR(50),
    age INT
);

-- ------------------------------------------------------------
-- 12. Best Practices
-- ------------------------------------------------------------
-- • Use plural table names.
-- • Use meaningful names.
-- • Use snake_case.
-- • Choose appropriate data types.
-- • Keep column names descriptive.
--
-- Good:
-- students
-- employees
-- products
--
-- Bad:
-- t1
-- abc
-- data

-- ------------------------------------------------------------
-- 13. Practice
-- ------------------------------------------------------------

CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

SHOW TABLES;

DESC employees;

ALTER TABLE employees
ADD email VARCHAR(100);

ALTER TABLE employees
MODIFY salary DECIMAL(12,2);

RENAME TABLE employees TO company_employees;

DESC company_employees;

TRUNCATE TABLE company_employees;

DROP TABLE company_employees;

-- ============================================================
-- End of Module 4
-- ============================================================