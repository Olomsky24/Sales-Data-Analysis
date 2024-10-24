CREATE TABLE sales(
sale_id INT PRIMARY KEY,
product_id INT,
customer_id INT,
sale_date DATE,
quantity INT,
total_amount DECIMAL (10,2));

SELECT*
FROM sales;


-- Insert at least 20 records into the `sales` table, making sure some customers buy multiple products. --

INSERT INTO sales (sale_id, product_id, customer_id, sale_date, quantity, total_amount) VALUES
(1, 9903, 32101, '2024-10-02', 4, 1202.00),
(2, 9905, 32101, '2024-10-02', 4, 200.00),
(3, 9909, 32113, '2024-10-03', 4, 2203.00),
(4, 9908, 32102, '2024-10-03', 2, 1800.00),
(5, 9901, 32108, '2024-10-03', 4, 603.00),
(6, 9902, 32108, '2024-10-03', 1, 750.50),
(7, 9910, 32134, '2024-10-04', 3, 1050.00),
(8, 9906, 32115, '2024-10-04', 1, 150.00),
(9, 9906, 32109, '2024-10-04', 2, 300.00),
(10, 9907, 32117, '2024-10-04', 4, 2600.00),
(11, 9909, 32128, '2024-10-05', 4, 2203.00),
(12, 9907, 32140, '2024-10-05', 5, 3250.00),
(13, 9910, 32136, '2024-10-05', 2, 700.00),
(14, 9903, 32118, '2024-10-06', 5, 1502.50),
(15, 9903, 32139, '2024-10-06', 2, 601.00),
(16, 9904, 32127, '2024-10-08', 4, 1800.00),
(17, 9908, 32135, '2024-10-08', 2, 1800.00),
(18, 9903, 32130, '2024-10-09', 2, 601.00),
(19, 9909, 32132, '2024-10-10', 2, 1652.25),
(20, 9904, 32138, '2024-10-12', 6, 2700.00);

SELECT*
FROM sales;


-- Write a query to calculate the total quantity sold for each product category. --

SELECT p.category,  SUM(s.quantity) AS total_quantity
FROM products AS p
INNER JOIN sales AS s
ON p.product_id = s.product_id
GROUP BY p.category;

-- Write a query to count the number of sales for each customer. --

SELECT c.customer_id, c.first_name, c.last_name, COUNT(s.sale_id) AS total_sales
FROM customers AS c
INNER JOIN sales AS s 
ON c.customer_id = s.customer_id
GROUP BY c.customer_id;

-- Write a query to get the sales records ordered by `sale_date` in ascending order. --

SELECT product_id, customer_id, sale_date
FROM sales
ORDER BY sale_date ASC;


-- Write a query to find products that have been sold more than 5 times, using `HAVING` with the `GROUP BY` statement. --

SELECT product_id, COUNT(product_id)
FROM sales
GROUP BY product_id
HAVING COUNT(product_id) >3;

-- Write a query to find products that have been sold more than 3 times, using `HAVING` with the `GROUP BY` statement. --

SELECT p.product_name, COUNT(s.sale_id) AS total_sales
FROM products AS p
INNER JOIN sales AS s 
ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING COUNT(s.sale_id) > 3;

-- Write a query to list customers who have made total purchases (sum of `total_amount`) exceeding $100. --

SELECT c.customer_id, c.first_name, c.last_name, SUM(s.total_amount) AS total_spent
FROM customers AS c
INNER JOIN sales AS s 
ON c.customer_id = s.customer_id
GROUP BY c.customer_id
HAVING SUM(s.total_amount) > 1000;


-- Write a query to find categories with a total sales revenue greater than $1000. --

SELECT category, SUM(s.total_amount) AS total_sales
FROM products AS p
INNER JOIN sales AS s 
ON p.product_id = s.product_id
GROUP BY category
HAVING SUM(s.total_amount) > 1000;


-- Write a query to display the 3 most recent sales. --

SELECT product_id, sale_date
FROM sales
ORDER BY sale_date DESC
LIMIT 3;

-- Write a query to calculate the total revenue (sum of `total_amount`) for each product and use an alias `total_revenue` for the calculated field. --

SELECT p.product_id, product_name, SUM(s.total_amount) AS total_revenue
FROM products AS p
INNER JOIN sales AS s 
ON p.product_id = s.product_id
GROUP BY p.product_id;

-- Use aliasing to create a column called `sales_value` representing the product of `price` and `quantity` for each sale. --

SELECT sale_id, product_name, price, quantity, price * quantity AS sales_value
FROM products AS p
INNER JOIN sales AS s
ON p.product_id = s.product_id;


-- Write a query to find the maximum `total_amount` from the `sales` table. --

SELECT MAX(total_amount)
FROM sales;


-- Write a query to calculate the total amount paid for all sales. --

SELECT SUM(total_amount)
FROM sales;


-- Write a query to calculate the minimum and maximum sale quantities. --

SELECT MIN(quantity), MAX(quantity)
FROM sales;


-- Write a query to identify the customer with the highest total purchase amount. --

SELECT c.customer_id, first_name, last_name, SUM(total_amount) AS total_spent
FROM customers AS c
INNER JOIN sales AS s 
ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY SUM(total_amount) DESC
LIMIT 1;


-- Write a query that retrieves the details of sales made in the last 30 days. --

SELECT *
FROM sales
WHERE sale_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


-- Create a query to display the top 3 customers with the most sales in terms of quantity. --

SELECT c.customer_id, c.first_name, c.last_name, SUM(s.quantity) AS total_quantity_sold
FROM customers AS c
INNER JOIN sales AS s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY total_quantity_sold DESC
LIMIT 3;
