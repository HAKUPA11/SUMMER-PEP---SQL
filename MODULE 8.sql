-- ============================================================
-- MODULE 8 : SQL FUNCTIONS
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- SQL Functions are built-in functions provided by MySQL
-- to perform operations on data.
--
-- Instead of manually manipulating values, SQL functions
-- perform calculations, formatting, conversions, and more.
--
-- Examples:
--
-- Convert names to uppercase.
-- Find the length of a string.
-- Round decimal values.
-- Get today's date.
-- Replace characters.
--
-- Functions make queries shorter, cleaner, and more efficient.

-- ============================================================
-- TYPES OF SQL FUNCTIONS
-- ============================================================
--
-- 1. String Functions
-- 2. Numeric Functions
-- 3. Date & Time Functions
-- 4. NULL Functions

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
(1,'Harsh','Delhi',95.75),
(2,'Rahul','Mumbai',82.45),
(3,'Priya','Pune',91.10);



-- ============================================================
-- STRING FUNCTIONS
-- ============================================================

-- ------------------------------------------------------------
-- UPPER()
-- ------------------------------------------------------------
-- Converts a string to uppercase.

SELECT UPPER(name)
FROM students;

---------------------------------------------------------------

-- LOWER()
-- ------------------------------------------------------------
-- Converts a string to lowercase.

SELECT LOWER(name)
FROM students;

---------------------------------------------------------------

-- LENGTH()
-- ------------------------------------------------------------
-- Returns the length of a string.

SELECT
name,
LENGTH(name)
FROM students;

---------------------------------------------------------------

-- CONCAT()
-- ------------------------------------------------------------
-- Joins multiple strings together.

SELECT CONCAT(name,' lives in ',city)
FROM students;

---------------------------------------------------------------

-- SUBSTRING()
-- ------------------------------------------------------------
-- Extracts part of a string.
--
-- Syntax:
-- SUBSTRING(string,start,length)

SELECT SUBSTRING(name,1,3)
FROM students;

---------------------------------------------------------------

-- REPLACE()
-- ------------------------------------------------------------
-- Replaces one substring with another.

SELECT REPLACE(city,'Delhi','New Delhi')
FROM students;

---------------------------------------------------------------

-- TRIM()
-- ------------------------------------------------------------
-- Removes leading and trailing spaces.

SELECT TRIM('   SQL Course   ');

---------------------------------------------------------------

-- LEFT()
-- ------------------------------------------------------------
-- Returns characters from the left.

SELECT LEFT(name,2)
FROM students;

---------------------------------------------------------------

-- RIGHT()
-- ------------------------------------------------------------
-- Returns characters from the right.

SELECT RIGHT(name,2)
FROM students;



-- ============================================================
-- NUMERIC FUNCTIONS
-- ============================================================

-- ROUND()
-- ------------------------------------------------------------
-- Rounds a decimal number.

SELECT ROUND(95.678);

SELECT ROUND(95.678,2);

---------------------------------------------------------------

-- CEIL()
-- ------------------------------------------------------------
-- Rounds UP to the next integer.

SELECT CEIL(12.2);

---------------------------------------------------------------

-- FLOOR()
-- ------------------------------------------------------------
-- Rounds DOWN to the previous integer.

SELECT FLOOR(12.9);

---------------------------------------------------------------

-- ABS()
-- ------------------------------------------------------------
-- Returns the absolute value.

SELECT ABS(-100);

---------------------------------------------------------------

-- MOD()
-- ------------------------------------------------------------
-- Returns the remainder.

SELECT MOD(17,5);

---------------------------------------------------------------

-- POWER()
-- ------------------------------------------------------------
-- Calculates exponent.

SELECT POWER(2,5);

---------------------------------------------------------------

-- SQRT()
-- ------------------------------------------------------------
-- Returns square root.

SELECT SQRT(81);

---------------------------------------------------------------

-- RAND()
-- ------------------------------------------------------------
-- Generates a random decimal between 0 and 1.

SELECT RAND();



-- ============================================================
-- DATE & TIME FUNCTIONS
-- ============================================================

-- NOW()
-- ------------------------------------------------------------
-- Returns current date and time.

SELECT NOW();

---------------------------------------------------------------

-- CURDATE()
-- ------------------------------------------------------------
-- Returns current date.

SELECT CURDATE();

---------------------------------------------------------------

-- CURTIME()
-- ------------------------------------------------------------
-- Returns current time.

SELECT CURTIME();

---------------------------------------------------------------

-- YEAR()

SELECT YEAR('2026-07-21');

---------------------------------------------------------------

-- MONTH()

SELECT MONTH('2026-07-21');

---------------------------------------------------------------

-- DAY()

SELECT DAY('2026-07-21');

---------------------------------------------------------------

-- DAYNAME()

SELECT DAYNAME('2026-07-21');

---------------------------------------------------------------

-- MONTHNAME()

SELECT MONTHNAME('2026-07-21');

---------------------------------------------------------------

-- DATEDIFF()
-- ------------------------------------------------------------
-- Difference between two dates.

SELECT DATEDIFF('2026-07-21','2026-07-01');

---------------------------------------------------------------

-- DATE_ADD()
-- ------------------------------------------------------------
-- Adds days/months/years.

SELECT DATE_ADD('2026-07-21',INTERVAL 10 DAY);

---------------------------------------------------------------

-- DATE_SUB()
-- ------------------------------------------------------------
-- Subtracts interval.

SELECT DATE_SUB('2026-07-21',INTERVAL 5 DAY);



-- ============================================================
-- NULL FUNCTIONS
-- ============================================================

-- IFNULL()
-- ------------------------------------------------------------
-- Replaces NULL with another value.

SELECT IFNULL(NULL,'Not Available');

---------------------------------------------------------------

-- COALESCE()
-- ------------------------------------------------------------
-- Returns the first non-NULL value.

SELECT COALESCE(NULL,NULL,'SQL',NULL);

---------------------------------------------------------------

-- Example

SELECT
name,
IFNULL(city,'Unknown')
FROM students;



-- ============================================================
-- USING FUNCTIONS WITH TABLE DATA
-- ============================================================

SELECT

UPPER(name),

ROUND(marks),

CONCAT(name,' - ',city)

FROM students;



-- ============================================================
-- NESTING FUNCTIONS
-- ============================================================

-- Functions can be combined.

SELECT

UPPER(LEFT(name,3))

FROM students;



-- ============================================================
-- COMMON MISTAKES
-- ============================================================

-- LENGTH() counts characters (or bytes depending on charset),
-- not words.

---------------------------------------------------------------

-- ROUND() does not always return an integer.

---------------------------------------------------------------

-- IFNULL() handles only one NULL expression.

---------------------------------------------------------------

-- Don't store dates as VARCHAR.
-- Date functions work correctly only with DATE/DATETIME types.



-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Use UPPER()/LOWER() for formatting text.

-- Use CONCAT() instead of manually joining strings.

-- Use DECIMAL with ROUND() for financial values.

-- Use DATE functions instead of string manipulation.

-- Use COALESCE() when checking multiple NULL values.



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

-- Q1. Difference between CEIL() and FLOOR()?

-- Q2. Difference between NOW() and CURDATE()?

-- Q3. Difference between IFNULL() and COALESCE()?

-- Q4. Difference between LENGTH() and CHAR_LENGTH()?
-- (CHAR_LENGTH counts characters, LENGTH may count bytes.)

-- Q5. Can SQL functions be nested?

-- Q6. What does DATEDIFF() return?



-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================

-- 1. Display student names in uppercase.

-- 2. Display student names in lowercase.

-- 3. Display the length of each student's name.

-- 4. Display "Name - City" using CONCAT().

-- 5. Display the first three characters of every name.

-- 6. Round all marks to the nearest integer.

-- 7. Find the square root of 144.

-- 8. Find today's date and current time.

-- 9. Add 30 days to today's date.

-- 10. Replace NULL city values with "Unknown".



-- ============================================================
-- MODULE 8 COMPLETE
-- ============================================================