#Create a database called “Sales” and create a new table named “Orders” in the Sales database with columns: (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No). 
#Create the database
CREATE DATABASE Sales;

#Use the database
USE Sales;

#Create the Orders table with constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name CHAR(50) NOT NULL,
    Product_Category CHAR(50) NOT NULL,
    Ordered_item CHAR(50) NOT NULL,
    Contact_No CHAR(15) UNIQUE NOT NULL
);

#1. Add a new column named “order_quantity” to the orders table.  
ALTER TABLE Orders ADD COLUMN order_quantity INT NOT NULL;


#2. Rename the orders table to the sales_orders table. 
RENAME TABLE Orders TO Sales_Orders;


#3. Insert 10 rows into the orders table.
INSERT INTO Orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice', 'Electronics', 'Laptop', '1234567890', 1),
(2, 'Bob', 'Furniture', 'Chair', '1234567891', 4),
(3, 'Charlie', 'Groceries', 'Apples', '1234567892', 10),
(4, 'David', 'Books', 'Novel', '1234567893', 2),
(5, 'Eve', 'Clothing', 'T-shirt', '1234567894', 3),
(6, 'Frank', 'Toys', 'Action Figure', '1234567895', 5),
(7, 'Grace', 'Kitchenware', 'Knife Set', '1234567896', 1),
(8, 'Hank', 'Sporting Goods', 'Basketball', '1234567897', 2),
(9, 'Ivy', 'Beauty', 'Lipstick', '1234567898', 4),
(10, 'Jack', 'Automotive', 'Car Wax', '1234567899', 1);
 
#4. Retrieve customer_name and Ordered_Item from the sales_orders table.
SELECT Customer_name, Ordered_item FROM Orders;
 
#5. Use the update command to change the name of the product for any row. 
UPDATE Orders SET Ordered_item = 'Smartphone' WHERE Order_Id = 1;

#6. Delete the sales_orders table from the database.
DROP TABLE Orders;
