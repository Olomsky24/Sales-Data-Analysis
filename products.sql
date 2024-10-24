CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR (50),
category VARCHAR (50),
price DECIMAL (10,2));

SELECT*
FROM products;

-- Insert at least 10 products into the `products` table. --

INSERT INTO products (product_id, product_name, category, price) VALUES
(9901, 'Microphone', 'Audio & Music', 150.75),
(9902, 'Mixer', 'Audio & Music', 750.50),
(9903, 'HP Laptop', 'Computers', 300.50),
(9904, 'Dell Desktop', 'Computers', 450.00),
(9905, 'Mouse', 'Computer Assessories', 50.00),
(9906, 'External Drive', 'Computer Assessories', 150.00),
(9907, '4G Solar Camera', 'Security & Surveilance', 650.00),
(9908, 'Smart Lock', 'Security & Surveilance', 900.00),
(9909, 'CCTV Camera', 'Security & Surveilance', 550.75),
(9910, 'Solar Alarm', 'Security & Surveilance', 350.00);

SELECT*
FROM products;

-- Write a query to calculate the total quantity sold for each product category. --

SELECT p.category, SUM(s.quantity) AS total_quantity
FROM products AS p
INNER JOIN sales AS s 
ON p.product_id = s.product_id
GROUP BY p.category;


-- Write a query to retrieve a list of products, sorted by price in descending order. --

SELECT product_name, price
FROM products
ORDER BY price DESC;

-- Write a query to display the top 5 most expensive products. --

SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;


-- Write a query to display the product names in uppercase. --

SELECT product_name, UPPER(product_name)
FROM products;


-- Write a query that trims extra spaces around product names and displays them. --

SELECT product_id, TRIM(product_name) AS trimmed_product_name
FROM products;

-- Write a query to calculate the average price of all products. --

SELECT AVG(price) AS average_price
FROM products;


-- Write a query to determine the number of distinct product categories available. --

SELECT COUNT(DISTINCT category) AS total_categories
FROM products;


-- Calculate the total number of products sold for each product category and sort the result in descending order. --

SELECT category, COUNT(s.product_id) AS total_products_sold
FROM products AS p
INNER JOIN sales AS s 
ON p.product_id = s.product_id
GROUP BY category
ORDER BY total_products_sold DESC;