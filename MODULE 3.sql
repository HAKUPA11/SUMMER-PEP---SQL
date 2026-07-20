-- ============================================================
-- MODULE 3 : DATABASES
-- ============================================================

-- ------------------------------------------------------------
-- 1. What is a Database?
-- ------------------------------------------------------------
-- A database is an organized collection of related data.
-- One MySQL server can contain multiple databases.
--
-- Example:
-- MySQL Server
-- ├── college_db
-- ├── company_db
-- ├── hospital_db
-- └── library_db

-- ------------------------------------------------------------
-- 2. CREATE DATABASE
-- ------------------------------------------------------------
-- Used to create a new database.
--
-- Syntax:
-- CREATE DATABASE database_name;

CREATE DATABASE college_db;

-- ------------------------------------------------------------
-- 3. SHOW DATABASES
-- ------------------------------------------------------------
-- Displays all databases present on the MySQL server.

SHOW DATABASES;

-- ------------------------------------------------------------
-- 4. USE DATABASE
-- ------------------------------------------------------------
-- Selects a database so that all subsequent SQL commands
-- are executed inside that database.
--
-- Syntax:
-- USE database_name;

USE college_db;

-- Verify the currently selected database.

SELECT DATABASE();

-- ------------------------------------------------------------
-- 5. CREATE DATABASE IF NOT EXISTS
-- ------------------------------------------------------------
-- Creates a database only if it does not already exist.
-- Prevents an error if the database is already present.

CREATE DATABASE IF NOT EXISTS college_db;

-- ------------------------------------------------------------
-- 6. DROP DATABASE
-- ------------------------------------------------------------
-- Permanently deletes a database along with all tables
-- and data stored inside it.
--
-- Use carefully.

-- Syntax:
-- DROP DATABASE database_name;

-- Example:
-- DROP DATABASE college_db;

-- ------------------------------------------------------------
-- 7. DROP DATABASE IF EXISTS
-- ------------------------------------------------------------
-- Deletes a database only if it exists.
-- Prevents an error when the database is absent.

-- Example:
-- DROP DATABASE IF EXISTS college_db;

-- ------------------------------------------------------------
-- 8. SHOW CREATE DATABASE
-- ------------------------------------------------------------
-- Displays the SQL statement used to create a database.

SHOW CREATE DATABASE college_db;

-- ------------------------------------------------------------
-- 9. RENAME DATABASE
-- ------------------------------------------------------------
-- MySQL does NOT support:
--
-- RENAME DATABASE old_name TO new_name;
--
-- To rename a database:
-- 1. Create a new database.
-- 2. Move tables to the new database.
-- 3. Drop the old database.

-- ------------------------------------------------------------
-- 10. Best Practices
-- ------------------------------------------------------------
-- • Use meaningful database names.
-- • Use lowercase names.
-- • Separate words using underscores (_).
--
-- Good Examples:
-- college_db
-- employee_db
-- library_db
-- ecommerce_db
--
-- Bad Examples:
-- db1
-- test
-- abc
-- MyDatabase

-- ------------------------------------------------------------
-- 11. Common Errors
-- ------------------------------------------------------------

-- Error:
-- Can't create database; database exists.
--
-- Solution:
-- CREATE DATABASE IF NOT EXISTS database_name;

-- Error:
-- Unknown database.
--
-- Solution:
-- Check the database name using:
-- SHOW DATABASES;

-- ------------------------------------------------------------
-- 12. Practice
-- ------------------------------------------------------------

-- Create a database named company_db.

CREATE DATABASE company_db;

-- Display all databases.

SHOW DATABASES;

-- Select company_db.

USE company_db;

-- Verify the selected database.

SELECT DATABASE();

-- Display the SQL used to create company_db.

SHOW CREATE DATABASE company_db;

-- Delete company_db.

DROP DATABASE company_db;

-- Create it again safely.

CREATE DATABASE IF NOT EXISTS company_db;

-- ============================================================
-- End of Module 3
-- ============================================================