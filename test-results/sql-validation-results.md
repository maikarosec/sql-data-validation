# SQL Data Validation Results

## Overview

This document contains the results of manual SQL data validation performed using SQLite and DBeaver.

The testing focused on retrieving, filtering, sorting, counting, grouping, and joining database records to verify that the stored data matched the expected results.

## Database Under Test

**Database:** SQLite  
**Tool:** DBeaver  
**Testing Type:** Manual SQL Data Validation

## Objectives

- Verify that records can be retrieved from the database.
- Validate filtered records using conditions.
- Verify record ordering.
- Validate record counts.
- Group and count records by category.
- Validate relationships between related database tables using JOIN queries.
- Investigate unexpected query results and identify potential data-quality issues.

---

## Test Case 01 — Retrieve All Users

### Objective

Verify that all user records can be retrieved from the `users` table.

### Query

```sql
SELECT *
FROM users;
```

### Expected Result

All user records should be returned with their available columns.

### Actual Result

6 user records were returned with 5 columns.

### Result

**PASS**

---

## Test Case 02 — Retrieve Specific User Information

### Objective

Verify that specific columns can be retrieved from the `users` table.

### Query

```sql
SELECT name, role
FROM users;
```

### Expected Result

The query should return the `name` and `role` columns for all users.

### Actual Result

6 rows were returned with the `name` and `role` columns.

### Result

**PASS**

---

## Test Case 03 — Retrieve Active Users

### Objective

Verify that only users with an `active` status are returned.

### Query

```sql
SELECT *
FROM users
WHERE status = 'active';
```

### Expected Result

Only users whose status is `active` should be returned.

### Actual Result

4 active users were returned.

### Result

**PASS**

---

## Test Case 04 — Retrieve Users Aged 20 or Older

### Objective

Verify that the database returns only users who are at least 20 years old.

### Query

```sql
SELECT *
FROM users
WHERE age >= 20;
```

### Expected Result

Only users with an age of 20 or older should be returned.

### Actual Result

5 users were returned. Their IDs were 1, 2, 4, 5, and 6.

### Result

**PASS**

---

## Test Case 05 — Sort Users by Age

### Objective

Verify that user records can be sorted from youngest to oldest.

### Query

```sql
SELECT *
FROM users
ORDER BY age ASC;
```

### Expected Result

Users should be ordered by age in ascending order.

### Actual Result

Users were returned in ascending age order: 19, 22, 24, 25, 28, and 30.

### Result

**PASS**

---

## Test Case 06 — Count Total Users

### Objective

Verify the total number of user records stored in the database.

### Query

```sql
SELECT COUNT(*)
FROM users;
```

### Expected Result

The query should return the total number of user records.

### Actual Result

The query returned a count of 6.

### Result

**PASS**

---

## Test Case 07 — Count QA Users

### Objective

Verify the number of users assigned the `QA` role.

### Query

```sql
SELECT COUNT(*)
FROM users
WHERE role = 'QA';
```

### Expected Result

The query should return 3 users assigned to the `QA` role.

### Initial Actual Result

The query initially returned a count of 1.

### Investigation

The `role` values in the `users` table were inspected after the unexpected result was observed.

Two records contained extra whitespace in the `role` value, causing them not to exactly match the `'QA'` filter condition.

### Corrective Action

The extra whitespace was removed from the affected `role` values.

### Retest Result

After correcting the inconsistent data, the query returned a count of 3.

### Final Result

**PASS — after data correction**

### Data Quality Finding

The unexpected query result was caused by inconsistent whitespace in the stored data.

This demonstrates the importance of checking data consistency when validating database results.

---

## Test Case 08 — Count Users by Role

### Objective

Verify the number of users belonging to each role.

### Query

```sql
SELECT role, COUNT(*)
FROM users
GROUP BY role;
```

### Expected Result

The query should group users by role and return the number of users in each group.

### Actual Result

| Role | Count |
|---|---:|
| QA | 3 |
| Developer | 2 |
| Designer | 1 |

### Result

**PASS**

---

## Test Case 09 — Retrieve Customer and Product Information

### Objective

Verify that customer records can be connected to their ordered products using related tables.

### Query

```sql
SELECT users.name, products.name
FROM users
JOIN orders
ON users.id = orders.customer_id
JOIN products
ON products.id = orders.product_id;
```

### Expected Result

The query should return the customer name and the product associated with each order.

### Actual Result

5 customer-product records were returned.

### Result

**PASS**

---

## Test Case 10 — Retrieve Products and Customers

### Objective

Verify that product records can be connected to the customers who ordered them.

### Query

```sql
SELECT products.name, users.name
FROM users
JOIN orders
ON orders.customer_id = users.id
JOIN products
ON products.id = orders.product_id;
```

### Expected Result

The query should return the product name and the corresponding customer name for each order.

### Actual Result

5 product-customer records were returned.

### Result

**PASS**

---

# Summary

A total of 10 SQL validation queries were performed using SQLite and DBeaver.

The exercises covered:

- `SELECT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `COUNT`
- `GROUP BY`
- `JOIN`

The validation also included investigation of an unexpected query result caused by inconsistent whitespace in stored role values.

The issue was identified, corrected, and successfully verified through retesting.

## Overall Result

**10 SQL validation queries completed successfully.**
