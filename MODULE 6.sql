-- ============================================================
-- MODULE 6 : CRUD OPERATIONS (CREATE, READ, UPDATE, DELETE)
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- CRUD represents the four fundamental operations performed on
-- data stored in a database.
--
-- C -> CREATE (Insert new data)
-- R -> READ   (Retrieve existing data)
-- U -> UPDATE (Modify existing data)
-- D -> DELETE (Remove existing data)
--
-- Almost every application performs CRUD operations.
--
-- Instagram
-- ----------
-- Create -> Upload a Post
-- Read   -> View Feed
-- Update -> Edit Caption
-- Delete -> Delete Post
--
-- Amazon
-- --------
-- Create -> Add Product
-- Read   -> View Products
-- Update -> Update Price
-- Delete -> Remove Product
--
-- Banking
-- --------
-- Create -> Open Account
-- Read   -> View Balance
-- Update -> Change Mobile Number
-- Delete -> Close Account
--
-- SQL provides four commands for CRUD:
--
-- INSERT
-- SELECT
-- UPDATE
-- DELETE
--
-- These commands belong to DML
-- (Data Manipulation Language).



-- ============================================================
-- SAMPLE TABLE
-- ============================================================

CREATE DATABASE IF NOT EXISTS college_db;

USE college_db;

CREATE TABLE IF NOT EXISTS students
(
    id INT,
    name VARCHAR(100),
    age INT,
    city VARCHAR(50),
    marks DECIMAL(5,2)
);



-- ============================================================
-- CREATE -> INSERT
-- ============================================================

-- INSERT adds new rows into a table.

-- Syntax

-- INSERT INTO table_name(column1,column2,...)
-- VALUES(value1,value2,...);

-- Every value is inserted according to the order of columns.

INSERT INTO students(id,name,age,city,marks)
VALUES
(1,'Harsh',20,'Delhi',95.5);

-- Explanation
--
-- INSERT INTO
--      Specifies the table.
--
-- (id,name,...)
--      Columns where data will be inserted.
--
-- VALUES
--      Actual values to insert.



-- ============================================================
-- INSERTING MULTIPLE ROWS
-- ============================================================

INSERT INTO students
(id,name,age,city,marks)

VALUES

(2,'Rahul',19,'Mumbai',82),

(3,'Priya',21,'Pune',91),

(4,'Aman',20,'Delhi',76),

(5,'Neha',22,'Jaipur',88);

-- This is much faster than writing five separate INSERT queries.



-- ============================================================
-- INSERT WITHOUT SPECIFYING COLUMNS
-- ============================================================

-- Possible only if values are supplied for EVERY column
-- in the exact order in which the table was created.

INSERT INTO students
VALUES
(6,'Rohan',23,'Lucknow',79);

-- Not Recommended.

-- Why?

-- If someone changes the table structure later,
-- this query may insert incorrect values or fail.

-- Always specify column names.



-- ============================================================
-- INSERT INTO SELECT
-- ============================================================

-- Used to copy data from one table to another.

-- Syntax

-- INSERT INTO table2(columns)
-- SELECT columns
-- FROM table1;



-- ============================================================
-- COMMON INSERT ERRORS
-- ============================================================

-- Error 1
--
-- Number of values doesn't match number of columns.
--
-- Wrong
--
-- INSERT INTO students(id,name)
-- VALUES(1);
--
-- Two columns but only one value.

---------------------------------------------------------------

-- Error 2
--
-- Wrong data type.
--
-- Example
--
-- age='Twenty'

---------------------------------------------------------------

-- Error 3
--
-- Inserting NULL where NOT NULL is defined.
--
-- (We'll learn constraints later.)



-- ============================================================
-- BEST PRACTICES FOR INSERT
-- ============================================================

-- Always specify column names.

-- Insert multiple rows together whenever possible.

-- Use meaningful values.

-- Avoid duplicate records.

-- Validate data before inserting.



-- ============================================================
-- READ -> SELECT
-- ============================================================

-- SELECT retrieves data from a table.

-- It NEVER modifies data.

-- Syntax

-- SELECT column_list
-- FROM table_name;



-- ============================================================
-- SELECT ALL COLUMNS
-- ============================================================

SELECT *
FROM students;

-- * means ALL columns.

-- Useful while learning.

-- Avoid using * in large production applications
-- because it retrieves unnecessary data.



-- ============================================================
-- SELECT SPECIFIC COLUMNS
-- ============================================================

SELECT
name,
marks

FROM students;

-- Retrieves only the required columns.

-- Faster than SELECT *.



-- ============================================================
-- SELECT WITH ALIAS
-- ============================================================

SELECT

name AS Student_Name,

marks AS Percentage

FROM students;

-- AS renames the column only in the output.

-- Actual table remains unchanged.



-- ============================================================
-- SIMPLE EXPRESSIONS
-- ============================================================

SELECT

name,

marks,

marks+5 AS Grace_Marks

FROM students;

-- SQL can perform calculations while retrieving data.



-- ============================================================
-- SELECT LITERAL VALUES
-- ============================================================

SELECT

'Welcome to SQL';

SELECT

100+200;

-- SQL can evaluate expressions even without tables.



-- ============================================================
-- DISTINCT
-- ============================================================

-- DISTINCT removes duplicate values.

SELECT DISTINCT city
FROM students;

-- Suppose cities are

-- Delhi
-- Delhi
-- Mumbai
-- Jaipur

-- Output

-- Delhi
-- Mumbai
-- Jaipur



-- ============================================================
-- LIMIT
-- ============================================================

-- LIMIT restricts the number of rows returned.

SELECT *
FROM students
LIMIT 3;

-- Returns only first three rows.

-- Very useful while working with huge tables.



-- ============================================================
-- COMMENTS
-- ============================================================

-- Single line comment

/*
Multiple
Line
Comment
*/



-- ============================================================
-- UPDATE
-- ============================================================

-- UPDATE modifies existing records.

-- Syntax

-- UPDATE table_name
-- SET column=value
-- WHERE condition;

-- Example

UPDATE students

SET city='Chandigarh'

WHERE id=1;

-- Only one row is updated because of WHERE.



-- ============================================================
-- UPDATE MULTIPLE COLUMNS
-- ============================================================

UPDATE students

SET

age=21,

marks=98

WHERE id=1;



-- ============================================================
-- WHAT IF WHERE IS OMITTED?
-- ============================================================

UPDATE students

SET city='India';

-- Every row becomes India.

-- This is one of the most common beginner mistakes.



-- ============================================================
-- DELETE
-- ============================================================

-- DELETE removes rows from a table.

-- Syntax

-- DELETE FROM table_name
-- WHERE condition;

DELETE FROM students

WHERE id=5;

-- Only one row is deleted.



-- ============================================================
-- DELETE WITHOUT WHERE
-- ============================================================

DELETE FROM students;

-- Every row is deleted.

-- Table structure remains.

-- Use carefully.



-- ============================================================
-- DELETE vs TRUNCATE
-- ============================================================

-- DELETE
--
-- Removes selected rows.
-- WHERE allowed.
-- Can delete one or all rows.

---------------------------------------------------------------

-- TRUNCATE
--
-- Removes ALL rows.
-- WHERE not allowed.
-- Faster than DELETE.
-- Table structure remains.



-- ============================================================
-- CRUD SUMMARY
-- ============================================================

-- INSERT
-- Creates new records.

-- SELECT
-- Reads existing records.

-- UPDATE
-- Modifies existing records.

-- DELETE
-- Removes existing records.



-- ============================================================
-- COMMON BEGINNER MISTAKES
-- ============================================================

-- Forgetting WHERE in UPDATE.

-- Forgetting WHERE in DELETE.

-- Using SELECT * everywhere.

-- Not specifying column names in INSERT.

-- Wrong order of inserted values.

-- Using wrong data types.



-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Always specify column names in INSERT.

-- Never execute UPDATE or DELETE without checking
-- the WHERE clause.

-- Prefer selecting required columns instead of *.

-- Test UPDATE/DELETE with SELECT first.

-- Example

-- Wrong

UPDATE students
SET marks=100;

-- Better

SELECT *
FROM students
WHERE id=3;

UPDATE students
SET marks=100
WHERE id=3;



-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================

-- Q1. What does CRUD stand for?

-- Q2. Difference between DELETE and TRUNCATE?

-- Q3. Why should we avoid SELECT *?

-- Q4. What happens if WHERE is omitted in UPDATE?

-- Q5. What happens if WHERE is omitted in DELETE?

-- Q6. Why should column names be specified in INSERT?



-- ============================================================
-- PRACTICE
-- ============================================================

-- 1. Insert five new students.

-- 2. Display only names.

-- 3. Display names and marks.

-- 4. Display unique cities.

-- 5. Display first three students.

-- 6. Change marks of student with id = 2.

-- 7. Change city of student with id = 4.

-- 8. Delete student whose id = 3.

-- 9. Delete every record.

-- 10. Insert the data again.



-- ============================================================
-- MODULE 6 COMPLETE
-- ============================================================