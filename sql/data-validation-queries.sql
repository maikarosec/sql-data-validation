-- SQL Data Validation Practice
-- Tool: DBeaver
-- Database: SQLite


-- Query 01: Retrieve all users
SELECT *
FROM users;


-- Query 02: Retrieve specific user columns
SELECT name, role
FROM users;


-- Query 03: Retrieve active users
SELECT *
FROM users
WHERE status = 'active';


-- Query 04: Find users aged 20 or older
SELECT *
FROM users
WHERE age >= 20;


-- Query 05: Sort users by age
SELECT *
FROM users
ORDER BY age ASC;


-- Query 06: Count all users
SELECT COUNT(*)
FROM users;


-- Query 07: Count QA users
SELECT COUNT(*)
FROM users
WHERE role = 'QA';


-- Query 08: Count users by role
SELECT role, COUNT(*)
FROM users
GROUP BY role;


-- Query 09: Show customer names and their ordered products
SELECT users.name, products.name
FROM users
JOIN orders
ON users.id = orders.customer_id
JOIN products
ON products.id = orders.product_id;


-- Query 10: Show product names and the customers who ordered them
SELECT products.name, users.name
FROM users
JOIN orders
ON orders.customer_id = users.id
JOIN products
ON products.id = orders.product_id;