-- ============================================================
-- MODULE 5 : DATA TYPES
-- ============================================================

-- ------------------------------------------------------------
-- 1. What are Data Types?
-- ------------------------------------------------------------
-- A data type defines the kind of data that can be stored
-- in a column.
--
-- Examples:
-- INT       -> Whole numbers
-- VARCHAR   -> Variable-length text
-- DATE      -> Dates
-- DECIMAL   -> Exact decimal values

-- ------------------------------------------------------------
-- 2. Categories of Data Types
-- ------------------------------------------------------------
-- 1. Numeric Data Types
-- 2. String Data Types
-- 3. Date & Time Data Types
-- 4. Boolean Data Type
-- 5. ENUM & SET Data Types
-- 6. JSON Data Type

-- ============================================================
-- NUMERIC DATA TYPES
-- ============================================================

-- TINYINT
-- Range: -128 to 127
-- Storage: 1 Byte
-- Example: Age, Rating

-- SMALLINT
-- Storage: 2 Bytes
-- Example: Student Count

-- MEDIUMINT
-- Storage: 3 Bytes

-- INT (INTEGER)
-- Storage: 4 Bytes
-- Range: -2,147,483,648 to 2,147,483,647
-- Most commonly used integer type.

-- BIGINT
-- Storage: 8 Bytes
-- Used for very large integers.

-- FLOAT
-- Approximate decimal values.
-- Faster but less precise.

-- DOUBLE
-- More precision than FLOAT.
-- Used for scientific calculations.

-- DECIMAL(M,D)
-- Exact decimal values.
--
-- M = Total digits
-- D = Digits after decimal
--
-- Example:
-- DECIMAL(10,2)
-- Maximum: 99999999.99
--
-- Best for:
-- Salary
-- Price
-- Bank Balance

-- ============================================================
-- STRING DATA TYPES
-- ============================================================

-- CHAR(n)
-- Fixed-length string.
--
-- Example:
-- CHAR(5)
--
-- 'ABC' becomes:
-- 'ABC  '
--
-- Faster for fixed-length data.
--
-- Use for:
-- Gender
-- Country Codes
-- PIN Codes

-- VARCHAR(n)
-- Variable-length string.
--
-- Stores only required characters.
--
-- Example:
-- VARCHAR(50)
--
-- Best for:
-- Names
-- Emails
-- Addresses

-- TEXT
-- Stores long text.
--
-- Maximum: ~65 KB
--
-- Example:
-- Comments
-- Descriptions
-- Articles

-- LONGTEXT
-- Stores very large text.
--
-- Maximum: 4 GB

-- ============================================================
-- DATE & TIME DATA TYPES
-- ============================================================

-- DATE
-- Format:
-- YYYY-MM-DD
--
-- Example:
-- 2026-07-20

-- TIME
-- Format:
-- HH:MM:SS
--
-- Example:
-- 14:30:15

-- DATETIME
-- Stores both date and time.
--
-- Format:
-- YYYY-MM-DD HH:MM:SS

-- TIMESTAMP
-- Similar to DATETIME.
-- Automatically tracks current timestamp.
-- Often used for:
-- created_at
-- updated_at

-- YEAR
-- Stores only the year.
--
-- Example:
-- 2026

-- ============================================================
-- BOOLEAN
-- ============================================================

-- BOOLEAN
-- TRUE is stored as 1
-- FALSE is stored as 0

-- Example:
-- is_active
-- is_verified

-- ============================================================
-- ENUM
-- ============================================================

-- ENUM allows only predefined values.
--
-- Example:
--
-- ENUM('Male','Female','Other')
--
-- Useful for:
-- Gender
-- Order Status
-- Payment Status

-- ============================================================
-- JSON
-- ============================================================

-- JSON stores structured JSON data.
--
-- Example:
--
-- {
--   "name":"Harsh",
--   "age":20
-- }
--
-- Useful for:
-- Flexible application settings
-- Metadata
-- API responses

-- ============================================================
-- EXAMPLE TABLE
-- ============================================================

CREATE TABLE employees(

    emp_id INT,

    name VARCHAR(100),

    age TINYINT,

    salary DECIMAL(10,2),

    email VARCHAR(100),

    joining_date DATE,

    login_time TIME,

    created_at DATETIME,

    updated_at TIMESTAMP,

    is_active BOOLEAN,

    gender ENUM('Male','Female','Other'),

    profile JSON

);

-- View the table structure

DESC employees;

-- ============================================================
-- BEST PRACTICES
-- ============================================================

-- Use INT for IDs.
--
-- Use VARCHAR instead of CHAR unless the length is fixed.
--
-- Use DECIMAL for money.
--
-- Use DATE for dates.
--
-- Use DATETIME or TIMESTAMP for timestamps.
--
-- Use BOOLEAN for true/false values.
--
-- Use ENUM only when the possible values are fixed.

-- ============================================================
-- COMMON MISTAKES
-- ============================================================

-- Don't use FLOAT for salary.
--
-- Wrong:
-- salary FLOAT
--
-- Correct:
-- salary DECIMAL(10,2)

-- Don't use CHAR for names.
--
-- Wrong:
-- name CHAR(100)
--
-- Correct:
-- name VARCHAR(100)

-- Don't store dates in VARCHAR.
--
-- Wrong:
-- dob VARCHAR(20)
--
-- Correct:
-- dob DATE

-- ============================================================
-- PRACTICE
-- ============================================================

CREATE TABLE products(

    product_id INT,

    product_name VARCHAR(100),

    description TEXT,

    price DECIMAL(10,2),

    stock INT,

    manufacture_date DATE,

    expiry_date DATE,

    available BOOLEAN

);

DESC products;

-- ============================================================
-- END OF MODULE 5
-- ============================================================