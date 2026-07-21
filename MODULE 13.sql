-- ============================================================
-- MODULE 13 : JOINS
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- A JOIN combines data from two or more tables
-- based on a related column.
--
-- Until now, we queried data from only one table.
--
-- In real-world databases, information is spread
-- across multiple tables.
--
-- Example:
--
-- Students Table
-- -----------------------
-- student_id
-- student_name
-- dept_id
--
-- Departments Table
-- -----------------------
-- dept_id
-- dept_name
--
-- If we want to display:
--
-- Student Name | Department Name
--
-- We need a JOIN.
--
-- Joins are among the most important SQL concepts
-- and are used in almost every real-world project.

-- ============================================================
-- WHY DO WE NEED JOINS?
-- ============================================================
--
-- Consider the following tables:
--
-- Students
--
-- +------------+------------+---------+
-- | student_id | name       | dept_id |
-- +------------+------------+---------+
-- | 1          | Harsh      | 101     |
-- | 2          | Rahul      | 102     |
-- | 3          | Priya      | 101     |
-- +------------+------------+---------+
--
-- Departments
--
-- +---------+-------------------+
-- | dept_id | dept_name         |
-- +---------+-------------------+
-- | 101     | Computer Science  |
-- | 102     | Mechanical        |
-- +---------+-------------------+
--
-- Students table stores only dept_id.
--
-- Departments table stores department names.
--
-- JOIN combines both tables to produce:
--
-- Harsh  -> Computer Science
-- Rahul  -> Mechanical
-- Priya  -> Computer Science

-- ============================================================
-- SAMPLE TABLES
-- ============================================================

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO departments VALUES
(101,'Computer Science'),
(102,'Mechanical'),
(103,'Civil');

---------------------------------------------------------------

CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
);

INSERT INTO students VALUES
(1,'Harsh',101),
(2,'Rahul',102),
(3,'Priya',101),
(4,'Aman',103);



-- ============================================================
-- INNER JOIN
-- ============================================================
--
-- Returns only matching rows
-- from both tables.
--
-- This is the most commonly used JOIN.
--
-- Syntax
--
-- SELECT columns
-- FROM table1
-- INNER JOIN table2
-- ON table1.column = table2.column;

SELECT
students.student_name,
departments.dept_name

FROM students

INNER JOIN departments

ON students.dept_id = departments.dept_id;

---------------------------------------------------------------

-- Result
--
-- Harsh  -> Computer Science
-- Rahul  -> Mechanical
-- Priya  -> Computer Science
-- Aman   -> Civil

---------------------------------------------------------------

-- Short Form

SELECT
student_name,
dept_name
FROM students
JOIN departments
ON students.dept_id=departments.dept_id;

-- JOIN means INNER JOIN by default.



-- ============================================================
-- TABLE ALIAS
-- ============================================================
--
-- Aliases make queries shorter and easier to read.

SELECT

s.student_name,

d.dept_name

FROM students AS s

JOIN departments AS d

ON s.dept_id=d.dept_id;

---------------------------------------------------------------

-- AS keyword is optional.

SELECT

s.student_name,

d.dept_name

FROM students s

JOIN departments d

ON s.dept_id=d.dept_id;



-- ============================================================
-- LEFT JOIN
-- ============================================================
--
-- Returns:
--
-- • All rows from LEFT table.
-- • Matching rows from RIGHT table.
--
-- If no match exists,
-- NULL values are returned.

---------------------------------------------------------------

SELECT

s.student_name,

d.dept_name

FROM students s

LEFT JOIN departments d

ON s.dept_id=d.dept_id;

---------------------------------------------------------------

-- Remember:
--
-- LEFT table is always preserved.



-- ============================================================
-- RIGHT JOIN
-- ============================================================
--
-- Returns:
--
-- • All rows from RIGHT table.
-- • Matching rows from LEFT table.
--
-- If no match exists,
-- NULL values are returned.

---------------------------------------------------------------

SELECT

s.student_name,

d.dept_name

FROM students s

RIGHT JOIN departments d

ON s.dept_id=d.dept_id;

---------------------------------------------------------------

-- RIGHT table is always preserved.



-- ============================================================
-- FULL OUTER JOIN
-- ============================================================
--
-- Returns:
--
-- • All rows from LEFT table.
-- • All rows from RIGHT table.
--
-- Matching rows are combined.
--
-- MySQL DOES NOT support
-- FULL OUTER JOIN directly.

---------------------------------------------------------------

-- MySQL Workaround

SELECT

s.student_name,

d.dept_name

FROM students s

LEFT JOIN departments d

ON s.dept_id=d.dept_id

UNION

SELECT

s.student_name,

d.dept_name

FROM students s

RIGHT JOIN departments d

ON s.dept_id=d.dept_id;



-- ============================================================
-- CROSS JOIN
-- ============================================================
--
-- Produces every possible combination
-- of both tables.
--
-- Number of Rows
--
-- = Rows in Table A
-- ×
-- Rows in Table B

---------------------------------------------------------------

SELECT *

FROM students

CROSS JOIN departments;

---------------------------------------------------------------

-- Example
--
-- 4 Students
--
-- 3 Departments
--
-- Output
--
-- 12 Rows



-- ============================================================
-- SELF JOIN
-- ============================================================
--
-- A table joins with itself.
--
-- Useful when rows
-- are related to other rows
-- in the same table.
--
-- Example:
--
-- Employee
-- Manager

---------------------------------------------------------------

CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,

    emp_name VARCHAR(100),

    manager_id INT
);

---------------------------------------------------------------

SELECT

e.emp_name,

m.emp_name AS Manager

FROM employees e

LEFT JOIN employees m

ON e.manager_id=m.emp_id;



-- ============================================================
-- JOIN EXECUTION ORDER
-- ============================================================
--
-- MySQL processes JOINs as:
--
-- 1. FROM
-- 2. JOIN
-- 3. ON
-- 4. WHERE
-- 5. GROUP BY
-- 6. HAVING
-- 7. SELECT
-- 8. ORDER BY
-- 9. LIMIT



-- ============================================================
-- COMMON MISTAKES
-- ============================================================
--
-- Forgetting ON clause.
--
-- Joining wrong columns.
--
-- Using SELECT * unnecessarily.
--
-- Forgetting table aliases.
--
-- Confusing LEFT JOIN
-- with RIGHT JOIN.
--
-- Assuming MySQL supports
-- FULL OUTER JOIN directly.



-- ============================================================
-- BEST PRACTICES
-- ============================================================
--
-- Always join using Primary Key
-- and Foreign Key whenever possible.
--
-- Use aliases for readability.
--
-- Select only required columns.
--
-- Avoid CROSS JOIN unless required.
--
-- Always verify JOIN conditions.



-- ============================================================
-- INTERVIEW TRAPS
-- ============================================================
--
-- JOIN means INNER JOIN.
--
-- LEFT JOIN preserves
-- the LEFT table.
--
-- RIGHT JOIN preserves
-- the RIGHT table.
--
-- MySQL does NOT support
-- FULL OUTER JOIN.
--
-- SELF JOIN requires aliases.



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================
--
-- Q1. Difference between INNER and LEFT JOIN?
--
-- Q2. Difference between LEFT and RIGHT JOIN?
--
-- Q3. Does MySQL support FULL OUTER JOIN?
--
-- Q4. What is CROSS JOIN?
--
-- Q5. What is SELF JOIN?
--
-- Q6. Why are aliases used?
--
-- Q7. What happens if ON condition
-- is omitted?
--
-- Q8. Which JOIN is used most often?



-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================
--
-- 1. Display student names
--    with department names.
--
-- 2. Display all departments
--    even if no students exist.
--
-- 3. Display all students
--    even if department is missing.
--
-- 4. Create an Employee table
--    and display employee-manager pairs.
--
-- 5. Produce every combination
--    of students and departments.
--
-- 6. Display department-wise
--    student count using JOIN.
--
-- 7. Display students
--    whose department is
--    Computer Science.
--
-- 8. Write a FULL OUTER JOIN
--    using UNION.

-- ============================================================
-- SUMMARY
-- ============================================================
--
-- INNER JOIN
-- ------------
-- Returns only matching rows.
--
-- LEFT JOIN
-- ----------
-- Returns all rows
-- from left table.
--
-- RIGHT JOIN
-- -----------
-- Returns all rows
-- from right table.
--
-- FULL OUTER JOIN
-- ----------------
-- Returns all rows
-- from both tables.
-- (Not directly supported in MySQL.)
--
-- CROSS JOIN
-- -----------
-- Returns every possible combination.
--
-- SELF JOIN
-- ----------
-- Joins a table with itself.
--
-- Joins are the backbone
-- of relational databases.

-- ============================================================
-- MODULE 13 COMPLETE
-- ============================================================