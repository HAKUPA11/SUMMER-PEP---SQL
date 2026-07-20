-- MODULE 1
/*
Module 1 — Introduction to Databases
What is data?
What is a database?
Why databases exist
DBMS vs RDBMS
SQL History
SQL Standards
Types of Databases
Relational
NoSQL
Graph
Document
Key-Value
*/

-- ============================================================
-- MODULE 1 : INTRODUCTION TO DATABASES
-- ============================================================

-- ------------------------------------------------------------
-- 1. What is Data?
-- ------------------------------------------------------------
-- Data is a collection of raw facts and figures.
-- Examples: Name, Age, Salary, Marks, Address.
-- Data by itself has little meaning until it is processed.

-- ------------------------------------------------------------
-- 2. What is a Database?
-- ------------------------------------------------------------
-- A Database is an organized collection of related data
-- stored electronically for efficient access, management,
-- updating, and retrieval.

-- Advantages:
-- • Fast data retrieval
-- • Reduced data redundancy
-- • Better security
-- • Easy backup and recovery
-- • Supports multiple users

-- ------------------------------------------------------------
-- 3. Why Do Databases Exist?
-- ------------------------------------------------------------
-- Before databases, data was stored in files or paper records,
-- leading to several problems:
--
-- • Slow searching
-- • Duplicate data
-- • Data inconsistency
-- • Difficult updates
-- • Poor security
-- • No proper backup
--
-- Databases solve these problems by organizing data
-- efficiently and ensuring consistency.

-- ------------------------------------------------------------
-- 4. DBMS vs RDBMS
-- ------------------------------------------------------------

-- DBMS (Database Management System)
-- • Software used to create and manage databases.
-- • Stores data without enforcing relationships.
-- • Suitable for small applications.
--
-- Examples:
-- • File Systems
-- • Microsoft Access

-- RDBMS (Relational Database Management System)
-- • Stores data in tables (rows and columns).
-- • Maintains relationships using Primary Keys and Foreign Keys.
-- • Supports SQL and follows relational principles.
-- • Suitable for large and enterprise applications.
--
-- Examples:
-- • MySQL
-- • PostgreSQL
-- • Oracle Database
-- • Microsoft SQL Server

-- Difference:
--
-- DBMS
-- • Stores data as files or simple structures
-- • Relationships not enforced
-- • Less secure
-- • Limited concurrency
--
-- RDBMS
-- • Stores data in related tables
-- • Relationships enforced
-- • Better security
-- • Supports multiple users efficiently

-- ------------------------------------------------------------
-- 5. SQL History
-- ------------------------------------------------------------
-- • 1970 - Dr. Edgar F. Codd proposed the Relational Model.
-- • 1974 - IBM developed SEQUEL (Structured English Query Language).
-- • Later renamed to SQL (Structured Query Language).
-- • 1986 - ANSI adopted SQL as a standard.
-- • 1987 - ISO adopted SQL internationally.
-- • Today SQL is the standard language for relational databases.

-- ------------------------------------------------------------
-- 6. SQL Standards
-- ------------------------------------------------------------
-- SQL is standardized by:
-- • ANSI (American National Standards Institute)
-- • ISO (International Organization for Standardization)
--
-- Common SQL standards include:
-- • SQL-86
-- • SQL-89
-- • SQL-92
-- • SQL:1999
-- • SQL:2003
-- • SQL:2008
-- • SQL:2011
-- • SQL:2016
--
-- Most databases follow these standards but also provide
-- their own extensions and features.

-- ------------------------------------------------------------
-- 7. Types of Databases
-- ------------------------------------------------------------

-- A. Relational Database (RDBMS)
-- • Stores data in tables.
-- • Uses rows and columns.
-- • Supports SQL.
-- • Maintains relationships using keys.
--
-- Examples:
-- • MySQL
-- • PostgreSQL
-- • Oracle
-- • SQL Server

-- B. NoSQL Database
-- • Designed for large-scale and unstructured data.
-- • Highly scalable and flexible.
-- • Does not require fixed schemas.
--
-- Types of NoSQL:
-- • Document
-- • Key-Value
-- • Graph
-- • Column-Family

-- C. Graph Database
-- • Stores data as nodes and relationships (edges).
-- • Best for highly connected data.
--
-- Use Cases:
-- • Social networks
-- • Recommendation systems
-- • Fraud detection
--
-- Example:
-- • Neo4j

-- D. Document Database
-- • Stores data as JSON or BSON documents.
-- • Flexible schema.
-- • Good for web and mobile applications.
--
-- Example:
-- • MongoDB

-- E. Key-Value Database
-- • Stores data as key-value pairs.
-- • Extremely fast lookups.
-- • Commonly used for caching and sessions.
--
-- Examples:
-- • Redis
-- • Amazon DynamoDB

-- ============================================================
-- End of Module 1
-- ============================================================