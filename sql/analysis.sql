
-- 🔹 1. Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 🔹 2. Total Revenue
SELECT SUM(payment_value) AS total_revenue
FROM payments;

-- 🔹 3. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

-- 🔹 4. Orders by Status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 🔹 5. Monthly Orders Trend
SELECT
DATE_TRUNC('month', order_purchase_timestamp) AS month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 🔹 6. Monthly Revenue Trend
SELECT
DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
SUM(p.payment_value) AS revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

-- 🔹 7. Average Order Value
SELECT
SUM(payment_value) / COUNT(DISTINCT order_id) AS avg_order_value
FROM payments;

-- 🔹 8. Top Cities by Orders
SELECT
c.customer_city,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC
LIMIT 10;

-- 🔹 9. Top States by Revenue
SELECT
c.customer_state,
SUM(p.payment_value) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;


