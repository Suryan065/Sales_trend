-- Create a new database (if not already created)
CREATE DATABASE IF NOT EXISTS sales_db;

-- Select the database to use
USE sales_db;
-- Create the online_sales table
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

-- Insert sample sales data
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 250.00, 101),
(2, '2023-01-17', 150.00, 102),
(3, '2023-02-03', 400.00, 103),
(4, '2023-02-20', 100.00, 104),
(5, '2023-03-10', 600.00, 101),
(6, '2023-03-25', 350.00, 102),
(7, '2023-04-05', 700.00, 105),
(8, '2023-04-18', 800.00, 106),
(9, '2023-05-02', 500.00, 107),
(10,'2023-05-29', 200.00, 108);
-- Analyze revenue and order volume per month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
WHERE 
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    year, month
ORDER BY 
    year, month;
