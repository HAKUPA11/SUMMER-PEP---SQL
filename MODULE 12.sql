-- ============================================================
-- MODULE 12 : RELATIONSHIPS & DATABASE DESIGN
-- ============================================================

-- ****************************************************************
-- 1. INTRODUCTION
-- ****************************************************************
--
-- A relational database rarely contains just one table.
--
-- Real-world applications store data across multiple tables
-- that are connected using relationships.
--
-- Example:
--
-- College Management System
--
-- • Students
-- • Departments
-- • Courses
-- • Faculty
-- • Enrollments
--
-- Instead of storing everything in one table,
-- SQL divides related information into multiple tables.
--
-- This approach:
--
-- • Reduces duplicate data.
-- • Improves consistency.
-- • Makes updates easier.
-- • Saves storage.
-- • Improves database design.

-- ============================================================
-- WHAT IS A RELATIONSHIP?
-- ============================================================
--
-- A relationship defines how two or more tables
-- are connected.
--
-- Relationships are usually created using
-- PRIMARY KEY and FOREIGN KEY.
--
-- Example:
--
-- Departments
--
-- dept_id
-- dept_name
--
-- Students
--
-- student_id
-- student_name
-- dept_id
--
-- Here,
-- students.dept_id references departments.dept_id.
--
-- This tells MySQL which department
-- each student belongs to.

-- ============================================================
-- WHY DO WE NEED RELATIONSHIPS?
-- ============================================================
--
-- Bad Design
--
-- student_id | name  | department
-- --------------------------------
-- 101        | Harsh | Computer Science
-- 102        | Rahul | Computer Science
-- 103        | Aman  | Computer Science
--
-- Notice that "Computer Science"
-- is repeated multiple times.
--
-- Problems:
--
-- • Duplicate data.
-- • More storage required.
-- • Difficult to update.
-- • Greater chance of mistakes.
--
-- Better Design
--
-- Departments
--
-- dept_id | dept_name
-- -------------------
-- 1       | Computer Science
--
-- Students
--
-- student_id | student_name | dept_id
-- -----------------------------------
-- 101        | Harsh        | 1
-- 102        | Rahul        | 1
--
-- Now department information
-- is stored only once.

-- ============================================================
-- TYPES OF RELATIONSHIPS
-- ============================================================
--
-- SQL mainly supports three relationship types:
--
-- 1. One-to-One (1 : 1)
-- 2. One-to-Many (1 : N)
-- 3. Many-to-Many (M : N)

-- ============================================================
-- ONE-TO-ONE RELATIONSHIP (1 : 1)
-- ============================================================
--
-- One record in Table A
-- is related to exactly one record
-- in Table B.
--
-- Example:
--
-- Person
-- ↓
-- Aadhaar Card
--
-- One person has one Aadhaar.
-- One Aadhaar belongs to one person.
--
-- Other Examples:
--
-- • Citizen → Passport
-- • Employee → Locker
-- • Student → Identity Card

-- ============================================================
-- ONE-TO-MANY RELATIONSHIP (1 : N)
-- ============================================================
--
-- One record in Table A
-- can be related to many records
-- in Table B.
--
-- This is the MOST COMMON relationship.
--
-- Example:
--
-- Department
-- ↓
-- Students
--
-- Computer Science
-- ├── Harsh
-- ├── Rahul
-- └── Aman
--
-- One department
-- has many students.
--
-- Each student belongs
-- to only one department.

CREATE TABLE departments
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),

    dept_id INT,

    FOREIGN KEY(dept_id)
    REFERENCES departments(dept_id)
);

-- ============================================================
-- MANY-TO-MANY RELATIONSHIP (M : N)
-- ============================================================
--
-- Many records in Table A
-- relate to many records
-- in Table B.
--
-- Example:
--
-- Students
-- ↓
-- Courses
--
-- Harsh → DBMS
-- Harsh → Java
-- Rahul → DBMS
-- Rahul → Python
--
-- One student
-- can study many courses.
--
-- One course
-- can have many students.
--
-- SQL cannot implement
-- this relationship directly.

-- ============================================================
-- JUNCTION (BRIDGE) TABLE
-- ============================================================
--
-- A Many-to-Many relationship
-- is implemented using
-- a Junction Table.
--
-- Example:
--
-- Students
--
-- student_id
--
-- Courses
--
-- course_id
--
-- Enrollments
--
-- student_id
-- course_id
--
-- Enrollments stores
-- the relationship.

CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE courses
(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments
(
    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id,course_id),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    FOREIGN KEY(course_id)
    REFERENCES courses(course_id)
);

-- ============================================================
-- COMPOSITE PRIMARY KEY
-- ============================================================
--
-- A Composite Primary Key
-- consists of more than one column.
--
-- Example:
--
-- PRIMARY KEY(student_id,course_id)
--
-- Together these columns
-- uniquely identify one record.

-- ============================================================
-- REFERENTIAL INTEGRITY
-- ============================================================
--
-- Referential Integrity ensures
-- that relationships remain valid.
--
-- Example:
--
-- Student references
-- Department 5.
--
-- Department 5 must exist.
--
-- Otherwise,
-- the database becomes inconsistent.
--
-- FOREIGN KEY maintains
-- Referential Integrity.

-- ============================================================
-- ENTITY RELATIONSHIP (ER) DIAGRAM
-- ============================================================
--
-- An ER Diagram is a graphical
-- representation of database tables
-- and their relationships.
--
-- Example:
--
-- Departments
--      |
--      |
-- Students
--      |
--      |
-- Enrollments
--      |
--      |
-- Courses
--
-- ER Diagrams are created
-- before implementing databases.

-- ============================================================
-- NORMALIZATION
-- ============================================================
--
-- Normalization is the process
-- of organizing data
-- to reduce redundancy
-- and improve consistency.
--
-- Goals:
--
-- • Remove duplicate data.
-- • Improve maintainability.
-- • Prevent update anomalies.
--
-- Most real-world databases
-- are designed up to Third Normal Form (3NF).

-- ============================================================
-- FIRST NORMAL FORM (1NF)
-- ============================================================
--
-- Rules:
--
-- • One value per cell.
-- • No repeating groups.
--
-- Wrong
--
-- Harsh | Java,Python,C++
--
-- Correct
--
-- Harsh | Java
-- Harsh | Python
-- Harsh | C++

-- ============================================================
-- SECOND NORMAL FORM (2NF)
-- ============================================================
--
-- Rules:
--
-- • Must satisfy 1NF.
-- • Every non-key column
--   must depend on the entire Primary Key.
--
-- Mainly applies
-- when Composite Keys exist.

-- ============================================================
-- THIRD NORMAL FORM (3NF)
-- ============================================================
--
-- Rules:
--
-- • Must satisfy 2NF.
-- • Non-key columns
--   should depend only
--   on the Primary Key.
--
-- Example:
--
-- Store Department Name
-- inside Department table,
-- not Student table.

-- ============================================================
-- DENORMALIZATION
-- ============================================================
--
-- Sometimes duplicate data
-- is intentionally stored
-- for better performance.
--
-- This process is called
-- Denormalization.
--
-- Mostly used in:
--
-- • Data Warehouses
-- • Reporting Systems
-- • Analytics

-- ============================================================
-- COMMON MISTAKES
-- ============================================================
--
-- • Storing everything
--   in one table.
--
-- • Forgetting Foreign Keys.
--
-- • Using names instead of IDs.
--
-- • Ignoring Normalization.
--
-- • Creating unnecessary tables.

-- ============================================================
-- BEST PRACTICES
-- ============================================================
--
-- • Every table should have
--   a Primary Key.
--
-- • Use Integer IDs.
--
-- • Use Foreign Keys.
--
-- • Normalize up to 3NF.
--
-- • Use Junction Tables
--   for Many-to-Many relationships.
--
-- • Design the ER Diagram first.

-- ============================================================
-- INTERVIEW TRAPS
-- ============================================================
--
-- • One-to-Many is the
--   most common relationship.
--
-- • Many-to-Many always
--   requires a Junction Table.
--
-- • Composite Key uses
--   multiple columns.
--
-- • Foreign Keys maintain
--   Referential Integrity.

-- ============================================================
-- INTERVIEW QUESTIONS
-- ============================================================
--
-- Q1. What is a database relationship?
--
-- Q2. Difference between 1:1, 1:N and M:N?
--
-- Q3. Why do we use Foreign Keys?
--
-- Q4. What is Referential Integrity?
--
-- Q5. What is a Junction Table?
--
-- Q6. What is a Composite Primary Key?
--
-- Q7. What is Normalization?
--
-- Q8. Why is 3NF widely used?

-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================
--
-- 1. Create Student and Department tables.
--
-- 2. Create Student, Course and Enrollment tables.
--
-- 3. Identify the relationship between:
--    Student → Course
--    Department → Student
--    Citizen → Passport
--
-- 4. Explain why a Junction Table is needed.
--
-- 5. Draw an ER Diagram for a College
--    Management System.

-- ============================================================
-- SUMMARY
-- ============================================================
--
-- • Relationships connect tables.
--
-- • Primary Key uniquely identifies rows.
--
-- • Foreign Key creates relationships.
--
-- • One-to-Many is the most common relationship.
--
-- • Many-to-Many requires a Junction Table.
--
-- • Normalization reduces redundancy.
--
-- • Most databases are designed up to 3NF.

-- ============================================================
-- MODULE 12 COMPLETE
-- ============================================================