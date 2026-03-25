
-- 🔹 1. Check for NULL values in key columns

SELECT * FROM customers
WHERE customer_id IS NULL;

SELECT * FROM orders
WHERE order_id IS NULL;

SELECT * FROM payments
WHERE payment_value IS NULL;

-- 🔹 2. Remove duplicate records (if any)

-- Example for customers
DELETE FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1
);

-- Example for orders
DELETE FROM orders
WHERE order_id IN (
SELECT order_id
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1
);

-- 🔹 3. Standardize text fields (lowercase)

UPDATE customers
SET customer_city = LOWER(customer_city),
customer_state = LOWER(customer_state);

-- 🔹 4. Check invalid or negative payment values

SELECT *
FROM payments
WHERE payment_value <= 0;

-- 🔹 5. Handle missing timestamps

SELECT *
FROM orders
WHERE order_purchase_timestamp IS NULL;

-- 🔹 6. Convert timestamp format (if needed)

-- Example (PostgreSQL format already correct)
-- If using MySQL, ensure proper datetime format

-- 🔹 7. Check orphan records (data integrity)

-- Orders without customers
SELECT o.*
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Payments without orders
SELECT p.*
FROM payments p
LEFT JOIN orders o ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

-- 🔹 8. Remove unwanted spaces

UPDATE customers
SET customer_city = TRIM(customer_city);

-- 🔹 9. Verify cleaned data

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM payments;

