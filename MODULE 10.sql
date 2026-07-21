-- ============================================================
-- MODULE 10 : GROUP BY & HAVING
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- Aggregate functions calculate values over multiple rows.
--
-- Example:
--
-- SELECT AVG(marks) FROM students;
--
-- This returns ONE average for the entire table.
--
-- But what if we want:
--
-- • Average marks of each city?
-- • Number of students in each city?
-- • Total salary in each department?
--
-- Aggregate functions alone cannot do this.
--
-- GROUP BY solves this problem by dividing rows into groups.
--
-- Aggregate functions are then applied separately to each group.

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
(3,'Priya','Delhi',91),
(4,'Aman','Mumbai',76),
(5,'Neha','Jaipur',88),
(6,'Riya','Delhi',84);



-- ============================================================
-- GROUP BY
-- ============================================================

-- GROUP BY groups rows having the same value
-- in one or more columns.
--
-- Syntax:
--
-- SELECT column_name, aggregate_function(column)
-- FROM table_name
-- GROUP BY column_name;

---------------------------------------------------------------

-- Count students in each city.

SELECT
city,
COUNT(*) AS Total_Students
FROM students
GROUP BY city;

---------------------------------------------------------------

-- Average marks of each city.

SELECT
city,
AVG(marks) AS Average_Marks
FROM students
GROUP BY city;

---------------------------------------------------------------

-- Highest marks in each city.

SELECT
city,
MAX(marks) AS Highest_Marks
FROM students
GROUP BY city;

---------------------------------------------------------------

-- Lowest marks in each city.

SELECT
city,
MIN(marks) AS Lowest_Marks
FROM students
GROUP BY city;

---------------------------------------------------------------

-- Total marks of students in each city.

SELECT
city,
SUM(marks) AS Total_Marks
FROM students
GROUP BY city;



-- ============================================================
-- HOW GROUP BY WORKS
-- ============================================================

-- Original Data
--
-- Harsh   Delhi   95
-- Rahul   Mumbai  82
-- Priya   Delhi   91
-- Aman    Mumbai  76
-- Neha    Jaipur  88
-- Riya    Delhi   84
--
-- GROUP BY city creates:
--
-- Delhi
-- -------
-- 95
-- 91
-- 84
--
-- Mumbai
-- --------
-- 82
-- 76
--
-- Jaipur
-- --------
-- 88
--
-- Aggregate functions are then applied
-- to each group separately.



-- ============================================================
-- GROUP BY MULTIPLE COLUMNS
-- ============================================================

-- Rows can also be grouped using more than one column.

-- Syntax

-- GROUP BY column1, column2;

-- Example

-- SELECT city, age, COUNT(*)
-- FROM students
-- GROUP BY city, age;

-- Each unique combination of city and age
-- becomes a separate group.



-- ============================================================
-- HAVING CLAUSE
-- ============================================================

-- WHERE filters rows BEFORE grouping.
--
-- HAVING filters groups AFTER grouping.
--
-- Syntax
--
-- SELECT columns
-- FROM table
-- GROUP BY column
-- HAVING condition;

---------------------------------------------------------------

-- Show cities having more than two students.

SELECT
city,
COUNT(*) AS Total_Students
FROM students
GROUP BY city
HAVING COUNT(*) > 2;

---------------------------------------------------------------

-- Show cities whose average marks are above 85.

SELECT
city,
AVG(marks) AS Average_Marks
FROM students
GROUP BY city
HAVING AVG(marks) > 85;



-- ============================================================
-- WHERE vs HAVING
-- ============================================================

-- WHERE
--
-- • Filters individual rows.
-- • Executed before GROUP BY.
-- • Cannot use aggregate functions.
--
-- Example

SELECT *
FROM students
WHERE marks > 80;

---------------------------------------------------------------

-- HAVING
--
-- • Filters groups.
-- • Executed after GROUP BY.
-- • Can use aggregate functions.
--
-- Example

SELECT
city,
AVG(marks)
FROM students
GROUP BY city
HAVING AVG(marks) > 85;



-- ============================================================
-- USING WHERE AND HAVING TOGETHER
-- ============================================================

-- First:
-- WHERE removes unwanted rows.
--
-- Then:
-- GROUP BY creates groups.
--
-- Finally:
-- HAVING filters those groups.

SELECT
city,
AVG(marks)
FROM students
WHERE marks >= 80
GROUP BY city
HAVING AVG(marks) >= 85;



-- ============================================================
-- ORDER BY WITH GROUP BY
-- ============================================================

-- Groups can be sorted.

SELECT
city,
AVG(marks) AS Average_Marks
FROM students
GROUP BY city
ORDER BY Average_Marks DESC;



-- ============================================================
-- EXECUTION ORDER
-- ============================================================

-- Although we write:
--
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
--
-- MySQL executes:
--
-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT
-- 6. ORDER BY
-- 7. LIMIT

-- Understanding this order makes debugging
-- much easier.



-- ============================================================
-- COMMON MISTAKES
-- ============================================================

-- Wrong

SELECT city,name
FROM students
GROUP BY city;

-- Problem:
--
-- name is neither grouped nor aggregated.
--
-- Depending on SQL mode, MySQL may produce
-- an error (ONLY_FULL_GROUP_BY) or undefined results.

---------------------------------------------------------------

-- Wrong

SELECT city
FROM students
HAVING city='Delhi';

-- Better

SELECT city
FROM students
WHERE city='Delhi';

---------------------------------------------------------------

-- Wrong

WHERE COUNT(*) > 2;

-- Aggregate functions cannot be used in WHERE.

-- Correct

HAVING COUNT(*) > 2;



-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Use WHERE to reduce rows before grouping.

-- Use HAVING only for aggregate conditions.

-- Always give aggregate columns aliases.

-- Use ORDER BY to make grouped results readable.

-- Avoid selecting columns that are neither
-- grouped nor aggregated.



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

-- Q1. What is GROUP BY?

-- Q2. Difference between WHERE and HAVING?

-- Q3. Can HAVING be used without GROUP BY?
-- (Yes. It acts like a filter on the final result.)

-- Q4. Can aggregate functions be used in WHERE?

-- Q5. Which clause executes first:
-- WHERE or GROUP BY?

-- Q6. Can GROUP BY have multiple columns?



-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================

-- 1. Count students in each city.

-- 2. Find average marks of each city.

-- 3. Find highest marks in each city.

-- 4. Find lowest marks in each city.

-- 5. Find total marks in each city.

-- 6. Display cities having more than one student.

-- 7. Display cities with average marks above 85.

-- 8. Sort cities by average marks in descending order.

-- 9. Display cities with total marks above 170.

-- 10. Display number of students in each city,
-- sorted from highest to lowest.



-- ============================================================
-- REAL-WORLD EXAMPLES
-- ============================================================

-- Count employees in each department.

-- Find average salary by department.

-- Find total sales for each product.

-- Count orders placed in each city.

-- Find highest-paid employee in each department.

-- Calculate monthly revenue.



-- ============================================================
-- SUMMARY
-- ============================================================

-- GROUP BY
-- ----------
-- Divides rows into groups.

-- Aggregate Functions
-- --------------------
-- Perform calculations on each group.

-- HAVING
-- --------
-- Filters groups after grouping.

-- WHERE
-- -------
-- Filters rows before grouping.

-- ORDER BY
-- ----------
-- Sorts the final result.



-- ============================================================
-- MODULE 10 COMPLETE
-- ============================================================