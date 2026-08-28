# SQL Data Validation

## Overview

This project demonstrates manual SQL data validation using SQLite and DBeaver.

The project was created as part of my QA skill development, with a focus on using SQL to retrieve, filter, sort, count, group, and validate data stored in a relational database.

The exercises also include validating relationships between related tables using SQL JOINs and investigating an unexpected query result caused by inconsistent data.

## Objective

The main objective of this project is to demonstrate how SQL can be used from a QA perspective to:

- Retrieve database records
- Filter records based on conditions
- Sort query results
- Count records
- Group and aggregate data
- Validate relationships between related tables
- Investigate unexpected query results
- Identify basic data-quality issues
- Retest data after correction

## Database

**Database:** SQLite

The database contains sample relational tables used for practicing SQL data validation:

- `users`
- `orders`
- `products`

The `orders` table serves as a relationship between users and products.

## Tools

- SQLite
- DBeaver
- SQL
- Git
- GitHub

## SQL Concepts Covered

The project covers the following SQL concepts:

- `SELECT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `COUNT`
- `GROUP BY`
- `JOIN`
- `ON`

## QA Validation Approach

The queries were approached as validation checks rather than only SQL syntax exercises.

The general process was:

**Expected Result → Execute Query → Inspect Actual Result → Compare → PASS/FAIL → Investigate if Unexpected**

This approach was used to verify whether the data returned by the database matched the expected conditions.

## Test Coverage

The SQL validation exercises included:

| Test Case | Validation |
|---|---|
| 01 | Retrieve all users |
| 02 | Retrieve specific user information |
| 03 | Retrieve active users |
| 04 | Retrieve users aged 20 or older |
| 05 | Sort users by age |
| 06 | Count total users |
| 07 | Count QA users |
| 08 | Count users by role |
| 09 | Retrieve customer and product information |
| 10 | Retrieve products and customers |

## Data Quality Investigation

During the `COUNT` validation for users with the `QA` role, the initial query returned an unexpected count.

The query was:

```sql
SELECT COUNT(*)
FROM users
WHERE role = 'QA';
```

The initial result was `1`, although 3 QA users were expected.

The `users` table was inspected to investigate the discrepancy. Two records contained extra whitespace in their `role` values, preventing them from exactly matching the `QA` filter.

After removing the inconsistent whitespace, the query was executed again and returned the expected count of `3`.

This demonstrated a basic QA data-validation workflow:

**Unexpected Result → Investigation → Identify Data Issue → Correction → Retest**

## JOIN Validation

The project also includes validation of relationships between the `users`, `orders`, and `products` tables.

The relationships used were:

```text
users.id
    ↕
orders.customer_id

orders.product_id
    ↕
products.id
```

The `orders` table acts as the bridge between customers and products.

Example:

```sql
SELECT users.name, products.name
FROM users
JOIN orders
ON users.id = orders.customer_id
JOIN products
ON products.id = orders.product_id;
```

This query was used to validate that customer records could be connected to the products associated with their orders.

## Project Structure

```text
sql-data-validation/
│
├── README.md
│
├── sql/
│   └── data-validation-queries.sql
│
├── test-results/
│   └── sql-validation-results.md
│
└── screenshots/
```

## Results

A total of 10 SQL validation queries were performed.

The exercises successfully demonstrated:

- Basic SQL data retrieval
- Conditional filtering
- Sorting
- Record counting
- Grouped aggregation
- Relational data validation using JOINs
- Investigation of unexpected database results
- Basic data-quality validation and retesting

## Key Learning

The main takeaway from this project is:

> SQL can be used by QA to check and validate data stored in a database.

Writing a correct query is only part of the process. The returned data must also be compared against the expected result, and unexpected results should be investigated rather than immediately treated as a defect.

## Project Status

**Completed**

**Date:** August 28, 2026
