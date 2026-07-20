-- ============================================================
-- MODULE 2 : MYSQL INSTALLATION & SETUP
-- ============================================================

-- ------------------------------------------------------------
-- 1. What is MySQL?
-- ------------------------------------------------------------
-- MySQL is an open-source Relational Database Management System
-- (RDBMS) that stores data in tables and uses SQL to manage it.
--
-- It is widely used in web development, backend development,
-- data analysis, and enterprise applications.

-- ------------------------------------------------------------
-- 2. MySQL Components
-- ------------------------------------------------------------

-- MySQL Server
-- • Stores databases and executes SQL queries.
-- • Runs as a background service.

-- MySQL Workbench
-- • Graphical interface (GUI) for MySQL.
-- • Used to write queries, create databases,
--   design tables, and manage data.

-- MySQL Command Line Client
-- • Terminal-based interface.
-- • Executes SQL commands directly.

-- MySQL Shell
-- • Advanced command-line client.
-- • Supports SQL, JavaScript, and Python modes.

-- ------------------------------------------------------------
-- 3. MySQL Server Architecture
-- ------------------------------------------------------------

-- Client
--     |
--     v
-- MySQL Server
--     |
--     v
-- Databases
--     |
--     v
-- Tables
--     |
--     v
-- Rows & Columns

-- ------------------------------------------------------------
-- 4. Connecting to MySQL
-- ------------------------------------------------------------

-- Step 1:
-- Start the MySQL Server.

-- Step 2:
-- Open MySQL Workbench.

-- Step 3:
-- Connect using:
-- • Host Name
-- • Port (Default: 3306)
-- • Username (Usually: root)
-- • Password

-- ------------------------------------------------------------
-- 5. Default System Databases
-- ------------------------------------------------------------

-- information_schema
-- Stores metadata about databases, tables, columns, etc.

-- mysql
-- Stores user accounts, passwords, and privileges.

-- performance_schema
-- Used for monitoring MySQL performance.

-- sys
-- Provides simplified views of performance statistics.

-- ------------------------------------------------------------
-- 6. Useful SQL Commands
-- ------------------------------------------------------------

-- Display all databases
SHOW DATABASES;

-- Display current database
SELECT DATABASE();

-- Display current logged-in user
SELECT USER();

-- Display MySQL version
SELECT VERSION();

-- ------------------------------------------------------------
-- 7. SQL Statement Categories
-- ------------------------------------------------------------

-- DDL (Data Definition Language)
-- Used to define database structure.
--
-- Commands:
-- CREATE
-- ALTER
-- DROP
-- TRUNCATE
-- RENAME

-- DML (Data Manipulation Language)
-- Used to manipulate data.
--
-- Commands:
-- INSERT
-- UPDATE
-- DELETE

-- DQL (Data Query Language)
-- Used to retrieve data.
--
-- Command:
-- SELECT

-- DCL (Data Control Language)
-- Used to manage permissions.
--
-- Commands:
-- GRANT
-- REVOKE

-- TCL (Transaction Control Language)
-- Used to control transactions.
--
-- Commands:
-- COMMIT
-- ROLLBACK
-- SAVEPOINT

-- ------------------------------------------------------------
-- 8. SQL Syntax Rules
-- ------------------------------------------------------------

-- SQL keywords are NOT case-sensitive.
--
-- Example:
-- SELECT
-- select
-- SeLeCt
--
-- All are valid.

-- By convention, SQL keywords are written in UPPERCASE.

-- Every SQL statement ends with a semicolon (;)

-- Comments:
-- Single-line comment
/* Multi-line
   comment */

-- ------------------------------------------------------------
-- 9. Naming Conventions (Best Practices)
-- ------------------------------------------------------------

-- Database names:
-- Use lowercase
-- Example:
-- college_db

-- Table names:
-- Use plural nouns
-- Example:
-- students
-- employees
-- courses

-- Column names:
-- Use snake_case
-- Example:
-- first_name
-- phone_number
-- date_of_birth

-- Avoid spaces and special characters.

-- ------------------------------------------------------------
-- 10. Learning Outcome
-- ------------------------------------------------------------

-- After this module, you should be able to:
-- ✓ Connect to MySQL
-- ✓ Understand MySQL components
-- ✓ Identify system databases
-- ✓ Execute basic SQL queries
-- ✓ Understand SQL command categories
-- ✓ Follow SQL syntax and naming conventions

-- ============================================================
-- End of Module 2
-- ============================================================