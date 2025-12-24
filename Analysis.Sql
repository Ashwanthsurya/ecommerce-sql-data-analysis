-- Total records check

SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_items FROM order_items;


-- Total customers by city

SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;


-- Total completed orders

SELECT COUNT(*) AS completed_orders
FROM orders
WHERE order_status = 'Completed';


-- Total revenue

SELECT
    SUM(oi.quantity * oi.price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';


-- Failed payments by method

SELECT
    payment_method,
    COUNT(*) AS failed_payments
FROM payments
WHERE payment_status = 'Failed'
GROUP BY payment_method
ORDER BY failed_payments DESC;


-- Top 5 products by quantity sold

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;


-- Orders per month

SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY 1
ORDER BY month;


-- Monthly revenue trend

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY 1
ORDER BY month;

-- Average order value (AOV)

SELECT
    ROUND(
        SUM(oi.quantity * oi.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';


-- Repeat vs one-time customers

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY 1;


-- Revenue by product category

SELECT
    p.category,
    SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;


-- Cancellation rate

SELECT
    ROUND(
        COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS cancellation_rate_percentage
FROM orders;
