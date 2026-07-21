-- ============================================================
-- MODULE 7 : FILTERING DATA
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- Until now, SELECT returned all rows from a table.
--
-- In real-world applications, we rarely need all data.
--
-- Examples:
--
-- • Students with marks > 90
-- • Employees with salary > 50000
-- • Orders placed today
-- • Customers from Delhi
--
-- SQL provides filtering clauses to retrieve only the
-- required records.
--
-- The main filtering tools are:
--
-- • WHERE
-- • Comparison Operators
-- • Logical Operators
-- • BETWEEN
-- • IN
-- • LIKE
-- • IS NULL
-- • ORDER BY
-- • LIMIT
-- • DISTINCT

-- ============================================================
-- SAMPLE TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS students
(
    id INT,
    name VARCHAR(100),
    age INT,
    city VARCHAR(50),
    marks DECIMAL(5,2)
);

INSERT INTO students VALUES
(1,'Harsh',20,'Delhi',95),
(2,'Rahul',19,'Mumbai',82),
(3,'Priya',21,'Pune',91),
(4,'Aman',20,'Delhi',76),
(5,'Neha',22,'Jaipur',88);



-- ============================================================
-- WHERE CLAUSE
-- ============================================================

-- WHERE filters rows based on a condition.
--
-- Syntax
--
-- SELECT columns
-- FROM table_name
-- WHERE condition;

SELECT *
FROM students
WHERE city='Delhi';

-- Only students whose city is Delhi are returned.

---------------------------------------------------------------

SELECT *
FROM students
WHERE age=20;

---------------------------------------------------------------

SELECT *
FROM students
WHERE marks>90;



-- ============================================================
-- COMPARISON OPERATORS
-- ============================================================

-- =
-- Equal to

SELECT *
FROM students
WHERE city='Mumbai';

---------------------------------------------------------------

-- != or <>
-- Not Equal

SELECT *
FROM students
WHERE city!='Delhi';

---------------------------------------------------------------

-- >

SELECT *
FROM students
WHERE marks>80;

---------------------------------------------------------------

-- <

SELECT *
FROM students
WHERE age<21;

---------------------------------------------------------------

-- >=

SELECT *
FROM students
WHERE marks>=90;

---------------------------------------------------------------

-- <=

SELECT *
FROM students
WHERE marks<=80;



-- ============================================================
-- LOGICAL OPERATORS
-- ============================================================

-- Logical operators combine multiple conditions.

-- AND
--
-- Both conditions must be TRUE.

SELECT *
FROM students
WHERE city='Delhi'
AND marks>80;

---------------------------------------------------------------

-- OR
--
-- At least one condition must be TRUE.

SELECT *
FROM students
WHERE city='Delhi'
OR city='Mumbai';

---------------------------------------------------------------

-- NOT
--
-- Reverses a condition.

SELECT *
FROM students
WHERE NOT city='Delhi';



-- ============================================================
-- BETWEEN
-- ============================================================

-- BETWEEN checks whether a value lies within a range.
--
-- It is inclusive.
--
-- Syntax
--
-- column BETWEEN value1 AND value2

SELECT *
FROM students
WHERE marks BETWEEN 80 AND 90;

---------------------------------------------------------------

SELECT *
FROM students
WHERE age BETWEEN 19 AND 21;



-- ============================================================
-- IN OPERATOR
-- ============================================================

-- IN checks whether a value matches one of several values.
--
-- It is a cleaner alternative to multiple OR conditions.

SELECT *
FROM students
WHERE city IN ('Delhi','Mumbai','Pune');

---------------------------------------------------------------

-- Equivalent to

-- city='Delhi'
-- OR city='Mumbai'
-- OR city='Pune'



-- ============================================================
-- NOT IN
-- ============================================================

SELECT *
FROM students
WHERE city NOT IN ('Delhi','Mumbai');



-- ============================================================
-- LIKE OPERATOR
-- ============================================================

-- LIKE searches for patterns.
--
-- Wildcards:
--
-- %  -> Zero or more characters
-- _  -> Exactly one character

---------------------------------------------------------------

-- Starts with H

SELECT *
FROM students
WHERE name LIKE 'H%';

---------------------------------------------------------------

-- Ends with h

SELECT *
FROM students
WHERE name LIKE '%h';

---------------------------------------------------------------

-- Contains "ar"

SELECT *
FROM students
WHERE name LIKE '%ar%';

---------------------------------------------------------------

-- Second character is 'a'

SELECT *
FROM students
WHERE name LIKE '_a%';



-- ============================================================
-- IS NULL
-- ============================================================

-- NULL means the value is missing or unknown.
--
-- '=' cannot be used with NULL.

SELECT *
FROM students
WHERE city IS NULL;



-- ============================================================
-- IS NOT NULL
-- ============================================================

SELECT *
FROM students
WHERE city IS NOT NULL;



-- ============================================================
-- ORDER BY
-- ============================================================

-- ORDER BY sorts the result.
--
-- ASC  -> Ascending (Default)
-- DESC -> Descending

SELECT *
FROM students
ORDER BY marks;

---------------------------------------------------------------

SELECT *
FROM students
ORDER BY marks ASC;

---------------------------------------------------------------

SELECT *
FROM students
ORDER BY marks DESC;

---------------------------------------------------------------

-- Multiple columns

SELECT *
FROM students
ORDER BY city,marks DESC;



-- ============================================================
-- LIMIT
-- ============================================================

-- LIMIT restricts the number of rows returned.

SELECT *
FROM students
LIMIT 3;

---------------------------------------------------------------

SELECT *
FROM students
ORDER BY marks DESC
LIMIT 2;

-- Returns top two scorers.



-- ============================================================
-- DISTINCT
-- ============================================================

-- DISTINCT removes duplicate values.

SELECT DISTINCT city
FROM students;

---------------------------------------------------------------

SELECT DISTINCT age
FROM students;



-- ============================================================
-- EXECUTION ORDER OF A QUERY
-- ============================================================

-- Although we write:

-- SELECT
-- FROM
-- WHERE
-- ORDER BY
-- LIMIT

-- MySQL processes it as:

-- 1. FROM
-- 2. WHERE
-- 3. SELECT
-- 4. ORDER BY
-- 5. LIMIT

-- Understanding this helps when writing complex queries.



-- ============================================================
-- COMMON MISTAKES
-- ============================================================

-- Wrong

SELECT *
FROM students
WHERE city=NULL;

-- Correct

SELECT *
FROM students
WHERE city IS NULL;

---------------------------------------------------------------

-- Wrong

WHERE marks=80 OR 90;

-- Correct

WHERE marks=80 OR marks=90;

---------------------------------------------------------------

-- Better

WHERE marks IN (80,90);

---------------------------------------------------------------

-- Forgetting quotes around strings.

-- Wrong

WHERE city=Delhi;

-- Correct

WHERE city='Delhi';



-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Use WHERE whenever possible to reduce unnecessary data.

-- Use IN instead of multiple OR conditions.

-- Use BETWEEN for ranges.

-- Use ORDER BY only when required because sorting
-- large datasets is expensive.

-- Always combine ORDER BY with LIMIT when retrieving
-- top records.



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

-- Q1. Difference between WHERE and HAVING?
-- (HAVING will be covered later.)

-- Q2. Difference between LIKE and = ?

-- Q3. Difference between IN and OR?

-- Q4. Difference between NULL and 0?

-- Q5. Difference between IS NULL and = NULL?

-- Q6. Difference between % and _ in LIKE?

-- Q7. What is the default sorting order in ORDER BY?



-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================

-- 1. Display students from Delhi.

-- 2. Display students with marks above 85.

-- 3. Display students aged between 19 and 21.

-- 4. Display students from Delhi or Jaipur.

-- 5. Display students not from Mumbai.

-- 6. Display students whose names start with 'P'.

-- 7. Display students whose names end with 'h'.

-- 8. Display all unique cities.

-- 9. Display top three students by marks.

-- 10. Display students sorted by age in descending order.



-- ============================================================
-- MODULE 7 COMPLETE
-- ============================================================