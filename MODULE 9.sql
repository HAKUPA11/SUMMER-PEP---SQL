-- ============================================================
-- MODULE 9 : AGGREGATE FUNCTIONS
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- Aggregate Functions perform calculations on multiple rows
-- and return a SINGLE value.
--
-- They are mainly used for:
--
-- • Counting records
-- • Finding totals
-- • Calculating averages
-- • Finding minimum values
-- • Finding maximum values
--
-- Aggregate Functions ignore NULL values
-- (except COUNT(*), which counts every row).
--
-- Common Aggregate Functions:
--
-- • COUNT()
-- • SUM()
-- • AVG()
-- • MIN()
-- • MAX()

-- ============================================================
-- SAMPLE TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS students
(
    id INT,
    name VARCHAR(100),
    city VARCHAR(50),
    marks DECIMAL(5,2)
);

INSERT INTO students VALUES
(1,'Harsh','Delhi',95),
(2,'Rahul','Mumbai',82),
(3,'Priya','Pune',91),
(4,'Aman','Delhi',76),
(5,'Neha','Jaipur',88);



-- ============================================================
-- COUNT()
-- ============================================================

-- COUNT() returns the number of records.

SELECT COUNT(*)
FROM students;

-- Output:
-- 5

---------------------------------------------------------------

-- Count values in a specific column.

SELECT COUNT(city)
FROM students;

---------------------------------------------------------------

-- Count unique cities.

SELECT COUNT(DISTINCT city)
FROM students;



-- ============================================================
-- COUNT(*) vs COUNT(column)
-- ============================================================

-- COUNT(*)
-- Counts every row.

-- COUNT(column)
-- Counts only NON-NULL values in that column.

-- Example

-- id | city
-- ------------
-- 1  | Delhi
-- 2  | NULL
-- 3  | Mumbai

-- COUNT(*)      = 3
-- COUNT(city)   = 2



-- ============================================================
-- SUM()
-- ============================================================

-- SUM() returns the total of a numeric column.

SELECT SUM(marks)
FROM students;

---------------------------------------------------------------

-- SUM works only on numeric columns.

-- Valid:
-- Marks
-- Salary
-- Quantity
-- Price

-- Invalid:
-- Name
-- City



-- ============================================================
-- AVG()
-- ============================================================

-- AVG() returns the average value.

SELECT AVG(marks)
FROM students;

---------------------------------------------------------------

-- Average marks of all students.

---------------------------------------------------------------

-- AVG ignores NULL values.



-- ============================================================
-- MIN()
-- ============================================================

-- MIN() returns the smallest value.

SELECT MIN(marks)
FROM students;

---------------------------------------------------------------

-- Alphabetically smallest city.

SELECT MIN(city)
FROM students;



-- ============================================================
-- MAX()
-- ============================================================

-- MAX() returns the largest value.

SELECT MAX(marks)
FROM students;

---------------------------------------------------------------

SELECT MAX(city)
FROM students;



-- ============================================================
-- USING MULTIPLE AGGREGATE FUNCTIONS
-- ============================================================

SELECT

COUNT(*) AS Total_Students,

SUM(marks) AS Total_Marks,

AVG(marks) AS Average_Marks,

MIN(marks) AS Lowest_Marks,

MAX(marks) AS Highest_Marks

FROM students;



-- ============================================================
-- AGGREGATE FUNCTIONS WITH WHERE
-- ============================================================

-- Aggregate functions can be combined with WHERE.

SELECT COUNT(*)
FROM students
WHERE city='Delhi';

---------------------------------------------------------------

SELECT AVG(marks)
FROM students
WHERE marks>=80;

---------------------------------------------------------------

SELECT MAX(marks)
FROM students
WHERE city='Mumbai';



-- ============================================================
-- DISTINCT WITH AGGREGATE FUNCTIONS
-- ============================================================

-- DISTINCT removes duplicate values before calculation.

SELECT COUNT(DISTINCT city)
FROM students;

---------------------------------------------------------------

-- Example

-- Marks
--
-- 90
-- 90
-- 80

-- AVG(marks)
-- = (90+90+80)/3

-- AVG(DISTINCT marks)
-- = (90+80)/2



-- ============================================================
-- AGGREGATE FUNCTIONS RETURN ONE ROW
-- ============================================================

-- Even if a table contains thousands of rows,
-- aggregate functions return ONE result.

SELECT AVG(marks)
FROM students;



-- ============================================================
-- NULL VALUES
-- ============================================================

-- Aggregate functions ignore NULL values.

-- Example

-- Marks
--
-- 90
-- NULL
-- 80

-- AVG(marks)

-- = (90+80)/2

-- NULL is ignored.

---------------------------------------------------------------

-- COUNT(*) still counts every row.



-- ============================================================
-- COMMON MISTAKES
-- ============================================================

-- Wrong

SELECT SUM(name)
FROM students;

-- SUM works only with numeric values.

---------------------------------------------------------------

-- Wrong

SELECT COUNT(NULL);

-- Returns 0.

---------------------------------------------------------------

-- COUNT(*) is different from COUNT(column).

---------------------------------------------------------------

-- AVG() ignores NULL values.



-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Use COUNT(*) when counting records.

-- Use COUNT(column) when NULL values should be ignored.

-- Use DISTINCT only when duplicates must be removed.

-- Don't use SUM() on non-numeric columns.

-- Prefer meaningful aliases.

-- Example

SELECT

AVG(marks) AS Average_Marks

FROM students;



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

-- Q1. Difference between COUNT(*) and COUNT(column)?

-- Q2. Do aggregate functions ignore NULL values?

-- Q3. Can SUM() work on VARCHAR?

-- Q4. Difference between AVG() and AVG(DISTINCT)?

-- Q5. Can aggregate functions be used with WHERE?

-- Q6. Which aggregate function counts duplicate rows?



-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================

-- 1. Count the total number of students.

-- 2. Count students from Delhi.

-- 3. Find total marks.

-- 4. Find average marks.

-- 5. Find highest marks.

-- 6. Find lowest marks.

-- 7. Count distinct cities.

-- 8. Find average marks of students from Delhi.

-- 9. Find highest marks scored in Mumbai.

-- 10. Display total students and average marks together.



-- ============================================================
-- WHAT'S NEXT?
-- ============================================================

-- Aggregate functions become truly powerful when combined with:
--
-- GROUP BY
-- HAVING
--
-- Example:
--
-- Find the average marks of EACH city.
--
-- This cannot be done using AVG() alone.
--
-- GROUP BY solves this problem.

-- ============================================================
-- MODULE 9 COMPLETE
-- ============================================================