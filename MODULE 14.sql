/*
==========================================================
MODULE 14 - SUBQUERIES
==========================================================

----------------------------------------------------------
1. WHAT IS A SUBQUERY?
----------------------------------------------------------

A subquery is a query written inside another SQL query.

The result of the inner query is used by the outer query.

Subqueries can appear inside:

• SELECT
• FROM
• WHERE
• HAVING

----------------------------------------------------------
2. WHY DO WE NEED SUBQUERIES?
----------------------------------------------------------

Subqueries are useful when:

✓ Comparing values dynamically.
✓ Finding aggregate-based results.
✓ Filtering records using another query.
✓ Performing nested calculations.
✓ Simplifying complex SQL logic.

Real World Examples

• Employees earning above average salary.
• Customers who never ordered.
• Products with maximum price.
• Students scoring above class average.

----------------------------------------------------------
3. GENERAL SYNTAX
----------------------------------------------------------

SELECT column_name
FROM table_name
WHERE column_name OPERATOR
(
    SELECT column_name
    FROM table_name
);

----------------------------------------------------------
4. TYPES OF SUBQUERIES
----------------------------------------------------------

1. Single Row Subquery

Returns exactly one row.

Operators

=
>
<
>=
<=
<>

----------------------------------

2. Multiple Row Subquery

Returns multiple rows.

Operators

IN
NOT IN
ANY
ALL

----------------------------------

3. Multiple Column Subquery

Returns multiple columns.

----------------------------------

4. Correlated Subquery

Depends on the outer query.

Executed once for every outer row.

----------------------------------------------------------
5. SINGLE ROW SUBQUERY
----------------------------------------------------------

Example Table

Employees

+----+---------+--------+
|id  |name     |salary  |
+----+---------+--------+
|1   |Harsh    |40000   |
|2   |Rahul    |50000   |
|3   |Aman     |60000   |
|4   |Riya     |70000   |
+----+---------+--------+

Question

Find employees earning more than the average salary.

Query

SELECT name, salary
FROM Employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employees
);

Output

+--------+--------+
|name    |salary  |
+--------+--------+
|Aman    |60000   |
|Riya    |70000   |
+--------+--------+

Explanation

Average Salary

(40000+50000+60000+70000)/4

= 55000

Only employees earning more than 55000 are returned.

----------------------------------------------------------
6. MULTIPLE ROW SUBQUERY
----------------------------------------------------------

Question

Find employees working in departments located in Delhi.

Tables

Departments

+------+-----------+
|id    |location   |
+------+-----------+
|1     |Delhi      |
|2     |Mumbai     |
|3     |Delhi      |
+------+-----------+

Employees

+---------+---------------+
|name     |department_id  |
+---------+---------------+
|Harsh    |1              |
|Rahul    |2              |
|Aman     |3              |
+---------+---------------+

Query

SELECT name
FROM Employees
WHERE department_id IN
(
    SELECT id
    FROM Departments
    WHERE location='Delhi'
);

Output

Harsh

Aman

----------------------------------------------------------
7. SUBQUERY IN WHERE CLAUSE
----------------------------------------------------------

Used for filtering records.

Example

Find products priced above average.

SELECT *
FROM Products
WHERE price >
(
    SELECT AVG(price)
    FROM Products
);

----------------------------------------------------------
8. SUBQUERY IN FROM CLAUSE
----------------------------------------------------------

Treats the subquery as a temporary table.

Example

SELECT AVG(avg_salary)
FROM
(
    SELECT AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department_id
) AS DeptSalary;

----------------------------------------------------------
9. SUBQUERY IN SELECT CLAUSE
----------------------------------------------------------

Example

SELECT
employee_name,
(
SELECT department_name
FROM Departments
WHERE Departments.id=Employees.department_id
)
AS Department
FROM Employees;

----------------------------------------------------------
10. CORRELATED SUBQUERY
----------------------------------------------------------

Example

Find employees earning more than their department average.

SELECT e1.name
FROM Employees e1
WHERE salary >
(
SELECT AVG(salary)
FROM Employees e2
WHERE e1.department_id=e2.department_id
);

Explanation

Outer Query

Employee

↓

Inner Query

Average salary of that employee's department

↓

Comparison

----------------------------------------------------------
11. EXISTS
----------------------------------------------------------

Returns TRUE if at least one row exists.

Example

SELECT name
FROM Customers c
WHERE EXISTS
(
SELECT *
FROM Orders o
WHERE c.customer_id=o.customer_id
);

Use Case

Customers who placed at least one order.

----------------------------------------------------------
12. NOT EXISTS
----------------------------------------------------------

Returns TRUE when no matching rows exist.

Example

SELECT name
FROM Customers c
WHERE NOT EXISTS
(
SELECT *
FROM Orders o
WHERE c.customer_id=o.customer_id
);

Use Case

Customers who never ordered.

----------------------------------------------------------
13. ANY
----------------------------------------------------------

Compares with ANY value returned.

Example

SELECT name
FROM Employees
WHERE salary > ANY
(
SELECT salary
FROM Employees
WHERE department_id=10
);

----------------------------------------------------------
14. ALL
----------------------------------------------------------

Compares with ALL returned values.

Example

SELECT name
FROM Employees
WHERE salary > ALL
(
SELECT salary
FROM Employees
WHERE department_id=10
);

----------------------------------------------------------
15. IN vs EXISTS
----------------------------------------------------------

IN

• Compares values.
• Better for small result sets.

EXISTS

• Checks row existence.
• Stops after first match.
• Usually better for large tables.

----------------------------------------------------------
16. CORRELATED vs NON-CORRELATED
----------------------------------------------------------

Non-Correlated

• Independent.
• Executes once.

Correlated

• Depends on outer query.
• Executes for every row.

----------------------------------------------------------
17. PERFORMANCE NOTES
----------------------------------------------------------

✓ Prefer JOIN if simpler.
✓ Use EXISTS for large tables.
✓ Index searched columns.
✓ Avoid deeply nested queries.
✓ Check execution plans.

----------------------------------------------------------
18. COMMON MISTAKES
----------------------------------------------------------

Wrong

WHERE salary =
(
SELECT salary
FROM Employees
);

Problem

Subquery returns multiple rows.

Correct

WHERE salary IN
(
SELECT salary
FROM Employees
);

----------------------------------

Wrong

WHERE id NOT IN
(
SELECT customer_id
FROM Orders
);

If Orders contains NULL,
NOT IN may return unexpected results.

Better

Use NOT EXISTS.

----------------------------------------------------------
19. INTERVIEW QUESTIONS
----------------------------------------------------------

Q1. What is a subquery?

Q2. Difference between JOIN and Subquery?

Q3. EXISTS vs IN?

Q4. Correlated vs Non-Correlated?

Q5. ANY vs ALL?

Q6. Which is usually faster?
JOIN or Subquery?

Q7. Can a subquery return multiple columns?

----------------------------------------------------------
20. PRACTICE QUESTIONS
----------------------------------------------------------

1. Find employees earning above average salary.

2. Find products costing more than average price.

3. Find customers who never ordered.

4. Find departments having more than five employees.

5. Find students scoring above class average.

6. Find products more expensive than every product in category A.

7. Find employees working in departments located in Delhi.

8. Find customers who ordered at least one product.

9. Find employees earning the highest salary in their department.

10. Find products having price equal to the maximum price.

----------------------------------------------------------
21. RELATED LEETCODE PROBLEMS
----------------------------------------------------------

✓ 181. Employees Earning More Than Their Managers

✓ 180. Consecutive Numbers

✓ 185. Department Top Three Salaries

✓ 262. Trips and Users

✓ 550. Game Play Analysis IV

✓ 585. Investments in 2016

✓ 1321. Restaurant Growth

✓ 601. Human Traffic of Stadium

----------------------------------------------------------
22. BEST PRACTICES
----------------------------------------------------------

✓ Use aliases.

✓ Prefer EXISTS over IN for large datasets.

✓ Avoid unnecessary nesting.

✓ Write readable SQL.

✓ Test the inner query independently.

✓ Prefer JOIN when it improves readability.

==========================================================
END OF MODULE 14
==========================================================
*/