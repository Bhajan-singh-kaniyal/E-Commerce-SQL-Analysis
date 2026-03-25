
SELECT * FROM customers
WHERE customer_id IS NULL;

SELECT * FROM orders
WHERE order_id IS NULL;

SELECT * FROM payments
WHERE payment_value IS NULL;




DELETE FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1
);


DELETE FROM orders
WHERE order_id IN (
SELECT order_id
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1
);



UPDATE customers
SET customer_city = LOWER(customer_city),
customer_state = LOWER(customer_state);


SELECT *
FROM payments
WHERE payment_value <= 0;



SELECT *
FROM orders
WHERE order_purchase_timestamp IS NULL;




SELECT o.*
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


SELECT p.*
FROM payments p
LEFT JOIN orders o ON p.order_id = o.order_id
WHERE o.order_id IS NULL;



UPDATE customers
SET customer_city = TRIM(customer_city);



SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM payments;

