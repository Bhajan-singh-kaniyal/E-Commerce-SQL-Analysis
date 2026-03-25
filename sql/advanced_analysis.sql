

-- 🔥 1. Top Customers (Window Function)

SELECT
o.customer_id,
SUM(p.payment_value) AS total_spent,
RANK() OVER (ORDER BY SUM(p.payment_value) DESC) AS rank
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id;

-- 🔥 2. Customer Segmentation (RFM Analysis)

WITH rfm AS (
SELECT
o.customer_id,
MAX(o.order_purchase_timestamp) AS last_order_date,
COUNT(o.order_id) AS frequency,
SUM(p.payment_value) AS monetary
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id
)

SELECT *,
CASE
WHEN monetary > 1000 THEN 'High Value'
WHEN monetary BETWEEN 500 AND 1000 THEN 'Medium Value'
ELSE 'Low Value'
END AS customer_segment
FROM rfm;

-- 🔥 3. Churn Customers (Inactive for 6 months)

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING MAX(order_purchase_timestamp) < CURRENT_DATE - INTERVAL '6 months';

-- 🔥 4. Best Selling Products

SELECT
product_id,
COUNT(*) AS total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;

-- 🔥 5. Revenue Contribution by Customers

SELECT
o.customer_id,
SUM(p.payment_value) AS revenue,
ROUND(
SUM(p.payment_value) * 100.0 /
SUM(SUM(p.payment_value)) OVER (),
2
) AS revenue_percentage
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY revenue DESC;

-- 🔥 6. Repeat Customers

SELECT customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


