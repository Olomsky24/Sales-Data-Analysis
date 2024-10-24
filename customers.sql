CREATE TABLE customers(
customer_id INT PRIMARY KEY,
first_name VARCHAR (50),
last_name VARCHAR (50),
email VARCHAR (100),
phone_number INT);

SELECT*
FROM customers;


-- Insert at least 40 customers into the `customers` table. --

INSERT INTO customers(customer_id, first_name, last_name, email, phone_number) VALUES
(32101, 'Benjamin', 'Bruce', 'benbruce45@gmail.com', 815409783),
(32102, 'Mubarak', 'Al-Amin', 'mubial@gmail.com', 805673459),
(32103, 'Adekunle', 'Olaosebikan', 'adola15@gmail.com', 702526731),
(32104, 'Suzan', 'Nzeribe', 'suzi4real@gmail.com', 817835409),
(32105, 'Anna', 'Wakili', 'anna414@gmail.com', 815403978),
(32106, 'Mike', 'Pedro', 'mikip5@gmail.com', 813540983),
(32107, 'Joshua', 'Arabambi', 'josh18@gmail.com', 803138940),
(32108, 'Samuel', 'Ochepo', 'samoch1@gmail.com', 815401389),
(32109, 'Bruno', 'Fefa', 'brunofe@gmail.com', 800653982),
(32110, 'Patience', 'Onyedika', 'pationye@gmail.com', 810673783),
(32111, 'Debby', 'Bruce', 'debby4real@gmail.com', 803696021),
(32112, 'Joseph', 'Salako', 'josylak@gmail.com', 83609783),
(32113, 'Omotola', 'Oladimeji', 'omot11@gmail.com', 812531229),
(32114, 'Marvel', 'Akinwale', 'marv89@gmail.com', 803310347),
(32115, 'Babatunde', 'Adeyanju', 'tunaman@gmail.com', 803527188),
(32116, 'Busola', 'Olowwkere', 'busigege@gmail.com', 813127490),
(32117, 'Samaila', 'Abdulkareem', 'samakareem@gmail.com', 802107385),
(32118, 'Raymon', 'Salami', 'raysal33@gmail.com', 813897833),
(32119, 'Lookman', 'Ademola', 'lookade@gmail.com', 802381903),
(32120, 'Victor', 'Boniface', 'bonivic@gmail.com', 803154031),
(32121, 'Uche', 'Okechukwu', 'uche15@gmail.com', 704987544),
(32122, 'Zarma', 'Dantata', 'zardata77@gmail.com', 802962243),
(32123, 'Jumai', 'Danbaba', 'jumybee44@gmail.com', 703749011),
(32124, 'Ojima', 'Sule', 'ojimasuu@gmail.com', 803769017),
(32125, 'Jumoke', 'Bamidele', 'jumidele@gmail.com', 803365799),
(32126, 'Anike', 'Jembewon', 'anikibaby@gmail.com', 803513607),
(32127, 'Benita', 'Ajetunmobi', 'benibaby@gmail.com', 803761831),
(32128, 'Adebimpe', 'Ezekiel', 'bimpelove@gmail.com', 701384671),
(32129, 'Solape', 'Ibironke', 'solaronky@gmail.com', 802873213),
(32130, 'Benjamin', 'Solagberu', 'bensoley@gmail.com', 813479120),
(32131, 'Benedicta', 'Henshaw', 'beny4real88@gmail.com', 813812938),
(32132, 'Adekunle', 'Oyinloye', 'oyinkunle@gmail.com', 803561093),
(32133, 'Henry', 'Ekundayo', 'heavyG12@gmail.com', 803005569),
(32134, 'Abiodun', 'Malaolu', 'biodunmala@gmail.com', 813712984),
(32135, 'Wasiu', 'Ajetunmobi', 'weseboy@gmail.com', 803240711),
(32136, 'Ismaila', 'Abubakar', 'ismolah27@gmail.com', 703205895),
(32137, 'Uchenna', 'Odinaka', 'uchenaka@gmail.com', 813129054),
(32138, 'Temidayo', 'Ayodeji', 'temmy73@gmail.com', 802736233),
(32139, 'Ayodeji', 'Lagbaja', 'ayolagba23@gmail.com', 803856124),
(32140, 'Julius', 'Obasanjo', 'obasjulie77@gmail.com', 813765395);

SELECT*
FROM customers;


-- Write a query to display customers sorted by their last name alphabetically. --

SELECT customer_id, last_name, first_name
FROM customers
ORDER BY last_name ASC;


-- Write a query to list the first 5 customers who made purchases. --

SELECT first_name, last_name, product_id, sale_date
FROM customers AS c
INNER JOIN sales AS s
ON c.customer_id = s.customer_id
ORDER BY sale_date ASC
LIMIT 5;


-- Write a query to display each customer's full name as `customer_name` by concatenating `first_name` and `last_name`. --

SELECT customer_id, first_name, last_name, CONCAT(first_name,'  ',last_name) AS customer_name
FROM customers;

-- Write a query to extract the domain from the `email` field of each customer. --

SELECT customer_id, first_name, last_name, SUBSTRING_INDEX(email, '@', -1) AS domain
FROM customers;


-- Write a query to display the first three characters of each customer's `last_name`. --

SELECT customer_id, first_name, last_name, SUBSTR(last_name, 1, 3) AS first_3_chars
FROM customers;


-- Write a query to list all customers whose names start with the letter "J". --

SELECT *
FROM customers
WHERE first_name LIKE 'J%';


-- Write a query that lists all sales made by customers whose last names contain the letter "e". --

SELECT sale_id, s.customer_id, first_name, last_name
FROM sales AS s
INNER JOIN customers AS c
ON s.customer_id = c.customer_id
WHERE last_name LIKE '%e%';