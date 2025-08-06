#1. Create the following tables inside the database ‘global_store_db’.
CREATE DATABASE  global_store_db;

USE global_store_db;

CREATE TABLE  products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);

CREATE TABLE  orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_ordered INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

#2.Alter the products table to add a new column named category (VARCHAR(50)) after the price column.
ALTER TABLE products
ADD COLUMN category VARCHAR(50) AFTER price;

#3. Rename the products table to inventory.
RENAME TABLE products TO inventory;

#4. Insert at least 10 records into the inventory table and 5 records into orders table and display the tables.
INSERT INTO inventory (name, price, quantity, category) VALUES
('Product1', 10.00, 20, 'Category1'),
('Product2', 15.50, 5, 'Category2'),
('Product3', 22.00, 12, 'Category1'),
('Product4', 8.75, 0, 'Category3'),
('Product5', 13.30, 7, 'Category2'),
('Product6', 19.99, 11, 'Category1'),
('Product7', 25.00, 3, 'Category3'),
('Product8', 30.00, 15, 'Category1'),
('Product9', 5.50, 0, 'Category2'),
('Product10', 45.00, 20, 'Category3');

INSERT INTO orders (product_id, quantity_ordered, order_date) VALUES
(1, 2, '2023-06-01'),
(3, 1, '2023-06-02'),
(5, 4, '2023-06-03'),
(7, 2, '2023-06-04'),
(10, 1, '2023-06-05');

SELECT * FROM inventory;

SELECT * FROM orders;

#5. Write queries for the following : 
 #a) Write a query to display distinct categories from the inventory table.
 SELECT DISTINCT category FROM inventory;
 
 #b) Select the top 5 products by their prices in descending order from the inventory table.
 SELECT * FROM inventory
 ORDER BY price DESC
 LIMIT 5;
 
 #c) Display the names of products with a quantity greater than 10 from the inventory table
 SELECT name FROM inventory
WHERE quantity > 10;

#d) Use the SUM() function to calculate the total price of all products in the inventory table.
SELECT SUM(price) AS total_price FROM inventory;

#e )Group products by their categories and display the count of products in each category.
SELECT category, COUNT(*) AS count_of_products
FROM inventory
GROUP BY category;

#f) Write a query to identify products that are currently out of stock (i.e., quantity is zero). Display the product details including the product name and price.
SELECT name, price FROM inventory
WHERE quantity = 0;

#6. Create a view named expensive_products that displays the details of products with a price above the average price of all products. 
CREATE VIEW expensive_products AS
SELECT * FROM inventory
WHERE price > (SELECT AVG(price) FROM inventory);

#7. Write a join query to display the names of products along with the corresponding order quantities from the inventory and orders tables. 
SELECT i.name, o.quantity_ordered
FROM inventory i
JOIN orders o ON i.product_id = o.product_id;

 


