-- ============================================================
-- MODULE 11 : CONSTRAINTS
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- Constraints are rules applied to table columns to ensure
-- that only valid and consistent data is stored.
--
-- They help maintain Data Integrity.
--
-- Without constraints, invalid data can be inserted,
-- leading to inconsistent and unreliable databases.
--
-- Examples:
--
-- • Two students having the same Roll Number.
-- • A student with NULL name.
-- • A negative salary.
-- • An order referring to a customer that doesn't exist.
--
-- Constraints prevent such situations.

-- ============================================================
-- TYPES OF CONSTRAINTS
-- ============================================================
--
-- 1. NOT NULL
-- 2. UNIQUE
-- 3. PRIMARY KEY
-- 4. FOREIGN KEY
-- 5. DEFAULT
-- 6. CHECK
-- 7. AUTO_INCREMENT

-- ============================================================
-- SAMPLE TABLE
-- ============================================================

CREATE TABLE students
(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK(age >= 18),
    city VARCHAR(50) DEFAULT 'Unknown'
);



-- ============================================================
-- NOT NULL
-- ============================================================

-- NOT NULL ensures that a column cannot store NULL values.
--
-- Every row MUST contain a value.

CREATE TABLE employees
(
    id INT,
    name VARCHAR(100) NOT NULL
);

---------------------------------------------------------------

-- Valid

INSERT INTO employees
VALUES(1,'Harsh');

---------------------------------------------------------------

-- Invalid

INSERT INTO employees
VALUES(2,NULL);

-- Error:
-- Column 'name' cannot be NULL.



-- ============================================================
-- UNIQUE
-- ============================================================

-- UNIQUE ensures that duplicate values
-- are NOT allowed.
--
-- NULL values are allowed
-- (MySQL permits multiple NULLs in UNIQUE columns).

CREATE TABLE users
(
    id INT,
    email VARCHAR(100) UNIQUE
);

---------------------------------------------------------------

-- Valid

INSERT INTO users
VALUES(1,'abc@gmail.com');

---------------------------------------------------------------

-- Invalid

INSERT INTO users
VALUES(2,'abc@gmail.com');

-- Duplicate entry error.



-- ============================================================
-- PRIMARY KEY
-- ============================================================

-- A PRIMARY KEY uniquely identifies every row.
--
-- Rules:
--
-- • Must be unique.
-- • Cannot be NULL.
-- • Only ONE Primary Key per table.
--
-- A Primary Key may consist of one or multiple columns
-- (Composite Primary Key).

CREATE TABLE students
(
    roll_no INT PRIMARY KEY,
    name VARCHAR(100)
);

---------------------------------------------------------------

-- Valid

INSERT INTO students
VALUES(101,'Harsh');

---------------------------------------------------------------

-- Invalid

INSERT INTO students
VALUES(101,'Rahul');

-- Duplicate Primary Key.

---------------------------------------------------------------

-- Invalid

INSERT INTO students
VALUES(NULL,'Harsh');



-- ============================================================
-- PRIMARY KEY vs UNIQUE
-- ============================================================

-- PRIMARY KEY
--
-- • Unique
-- • Cannot be NULL
-- • Only one per table

---------------------------------------------------------------

-- UNIQUE
--
-- • Unique
-- • NULL allowed
-- • Multiple UNIQUE constraints allowed



-- ============================================================
-- FOREIGN KEY
-- ============================================================

-- A FOREIGN KEY creates a relationship
-- between two tables.
--
-- It ensures that a value exists
-- in another table.

---------------------------------------------------------------

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

---------------------------------------------------------------

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),

    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
);

---------------------------------------------------------------

-- Valid

INSERT INTO departments
VALUES(1,'Computer Science');

INSERT INTO employees
VALUES(101,'Harsh',1);

---------------------------------------------------------------

-- Invalid

INSERT INTO employees
VALUES(102,'Rahul',10);

-- Department 10 doesn't exist.



-- ============================================================
-- WHY FOREIGN KEYS?
-- ============================================================

-- Without Foreign Keys:
--
-- Employee
-- --------
-- Harsh -> Dept 1
-- Rahul -> Dept 99
--
-- Dept 99 doesn't exist.
--
-- Database becomes inconsistent.
--
-- Foreign Keys prevent such invalid references.



-- ============================================================
-- DEFAULT
-- ============================================================

-- DEFAULT assigns a value automatically
-- when no value is provided.

CREATE TABLE products
(
    id INT,
    status VARCHAR(20)
    DEFAULT 'Available'
);

---------------------------------------------------------------

INSERT INTO products(id)
VALUES(1);

---------------------------------------------------------------

-- Output

-- id   status
-- -------------
-- 1    Available



-- ============================================================
-- CHECK
-- ============================================================

-- CHECK ensures values satisfy
-- a specified condition.

CREATE TABLE voters
(
    id INT,

    age INT
    CHECK(age>=18)
);

---------------------------------------------------------------

-- Valid

INSERT INTO voters
VALUES(1,20);

---------------------------------------------------------------

-- Invalid

INSERT INTO voters
VALUES(2,15);

-- CHECK constraint violation.

---------------------------------------------------------------

-- Note:
-- Older versions of MySQL ignored CHECK constraints.
-- Modern MySQL versions enforce them.



-- ============================================================
-- AUTO_INCREMENT
-- ============================================================

-- AUTO_INCREMENT automatically generates
-- sequential numeric values.
--
-- Mostly used with Primary Keys.

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_name VARCHAR(100)
);

---------------------------------------------------------------

INSERT INTO customers(customer_name)
VALUES('Harsh');

INSERT INTO customers(customer_name)
VALUES('Rahul');

---------------------------------------------------------------

-- Output

-- customer_id
--
-- 1
-- 2

---------------------------------------------------------------

-- No need to manually enter IDs.



-- ============================================================
-- ADDING CONSTRAINTS LATER
-- ============================================================

-- Constraints can also be added using ALTER TABLE.

-- Example

ALTER TABLE employees

ADD CONSTRAINT unique_email

UNIQUE(email);



-- ============================================================
-- REMOVING CONSTRAINTS
-- ============================================================

-- Constraints can also be removed.

-- Syntax depends on the constraint type.

-- Example

ALTER TABLE employees

DROP INDEX unique_email;

-- (We'll study ALTER TABLE in detail later.)



-- ============================================================
-- COMMON MISTAKES
-- ============================================================

-- Forgetting PRIMARY KEY.

---------------------------------------------------------------

-- Using names as PRIMARY KEY.

-- Names are not unique.

---------------------------------------------------------------

-- Not using AUTO_INCREMENT.

---------------------------------------------------------------

-- Creating FOREIGN KEY before creating
-- the referenced table.

---------------------------------------------------------------

-- Assuming UNIQUE and PRIMARY KEY
-- are exactly the same.



-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Every table should have a Primary Key.

-- Use AUTO_INCREMENT for numeric IDs.

-- Use UNIQUE for email, username, Aadhaar, etc.

-- Use FOREIGN KEY to maintain relationships.

-- Use DEFAULT for commonly repeated values.

-- Use CHECK to validate numeric ranges.

-- Use NOT NULL for mandatory fields.



-- ============================================================
-- INTERVIEW TRAPS
-- ============================================================

-- PRIMARY KEY automatically implies:
--
-- • UNIQUE
-- • NOT NULL

---------------------------------------------------------------

-- UNIQUE allows NULL values.

---------------------------------------------------------------

-- One table can have:
--
-- • One PRIMARY KEY
-- • Multiple UNIQUE constraints

---------------------------------------------------------------

-- AUTO_INCREMENT usually works
-- with integer columns only.



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

-- Q1. Difference between PRIMARY KEY and UNIQUE?

-- Q2. Why do we use FOREIGN KEY?

-- Q3. Difference between NOT NULL and DEFAULT?

-- Q4. Can PRIMARY KEY contain NULL?

-- Q5. Can a table have multiple PRIMARY KEYS?

-- Q6. Why is AUTO_INCREMENT useful?

-- Q7. What happens if a FOREIGN KEY
-- references a non-existing value?



-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================

-- 1. Create a Student table using:
--
-- id
-- name
-- email
-- age

-- Apply appropriate constraints.

---------------------------------------------------------------

-- 2. Create Department and Employee tables
-- using Foreign Keys.

---------------------------------------------------------------

-- 3. Create a Product table
-- with DEFAULT status.

---------------------------------------------------------------

-- 4. Create a Voter table
-- with CHECK(age>=18).

---------------------------------------------------------------

-- 5. Create a Customer table
-- using AUTO_INCREMENT.



-- ============================================================
-- SUMMARY
-- ============================================================

-- NOT NULL
-- ----------
-- Value cannot be NULL.

-- UNIQUE
-- --------
-- No duplicate values.

-- PRIMARY KEY
-- ------------
-- Unique + NOT NULL.

-- FOREIGN KEY
-- ------------
-- Maintains relationships.

-- DEFAULT
-- --------
-- Assigns default values.

-- CHECK
-- ------
-- Validates data.

-- AUTO_INCREMENT
-- ----------------
-- Generates automatic IDs.



-- ============================================================
-- MODULE 11 COMPLETE
-- ============================================================