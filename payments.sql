CREATE TABLE payments(
payment_id INT PRIMARY KEY,
sale_id INT,
payment_method ENUM ('Cash', 'ATM Card', 'Transfer'),
payment_date DATE,
amount_paid DECIMAL (10,2));

ALTER TABLE payments
MODIFY payment_method ENUM ('Cash', 'Credit Card', 'Transfer');

SELECT*
FROM payments;

-- Insert payment records corresponding to the sales, with varying amounts and dates. --

INSERT INTO payments (payment_id, sale_id, payment_method, payment_date, amount_paid) VALUES
(501, 1, 'Cash', '2024-10-02', 1202.00),
(502, 2, 'Cash', '2024-10-02', 200.00),
(503, 3, 'Credit Card', '2024-10-03', 2203.00),
(504, 4, 'Credit Card', '2024-10-03', 1800.00),
(505, 5, 'Cash', '2024-10-03', 603.00),
(506, 6, 'Transfer', '2024-10-03', 750.50),
(507, 7, 'Credit Card', '2024-10-04', 1050.00),
(508, 8, 'Cash', '2024-10-04', 150.00),
(509, 9, 'Transfer', '2024-10-04', 300.00),
(510, 10, 'Credit Card', '2024-10-04', 2600.00),
(511, 11, 'Credit Card', '2024-10-05', 2203.00),
(512, 12, 'Credit Card', '2024-10-05', 3250.00),
(513, 13, 'Transfer', '2024-10-05', 700.00),
(514, 14, 'Credit Card', '2024-10-06', 1502.50),
(515, 15, 'Cash', '2024-10-06', 601.00),
(516, 16, 'Credit Card', '2024-10-08', 1800.00),
(517, 17, 'Credit Card', '2024-10-08', 1800.00),
(518, 18, 'Transfer', '2024-10-09', 601.00),
(519, 19, 'Credit Card', '2024-10-10', 1652.25),
(520, 20, 'Credit Card', '2024-10-12', 2700.00);

SELECT*
FROM payments;


-- Write a query to find the total revenue generated by each payment method. --

SELECT payment_method, SUM(amount_paid) AS total_revenue
FROM payments
GROUP BY payment_method;


-- Write a query to calculate the total unpaid amount for each sale by subtracting `amount_paid` from `total_amount`. --

SELECT s.sale_id, s.customer_id, s.total_amount, p.amount_paid, s.total_amount - p.amount_paid AS unpaid_amount
FROM sales AS s
INNER JOIN payments AS p 
ON s.sale_id = p.sale_id;


-- Write a query to find sales where the payment method was "Credit Card" and the `total_amount` is greater than $1,700. --

SELECT product_id, payment_method, total_amount
FROM sales AS s
INNER JOIN payments AS p
ON s.sale_id = p.sale_id
WHERE payment_method = 'Credit Card'
AND total_amount > 1700;