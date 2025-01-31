--TechShop , electronic gadgets shop --

--Task - 1 :
-- 1 . Create the database named "TechShop"
Create database TechShop2

--2. Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables
-- based on the provided schema. --
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,        
    FirstName NVARCHAR(50) NOT NULL,   
    LastName NVARCHAR(50) NOT NULL,    
    Email NVARCHAR(100) NOT NULL,      
    Phone NVARCHAR(15) NOT NULL,       
    Address NVARCHAR(255)              
)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,           
    ProductName NVARCHAR(100) NOT NULL,  
    Description NVARCHAR(255),           
    Price DECIMAL(10, 2) NOT NULL        
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                
    CustomerID INT,                         
    OrderDate DATETIME NOT NULL,          
    TotalAmount DECIMAL(10, 2) NOT NULL,    
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,            
    OrderID INT,                              
    ProductID INT,                            
    Quantity INT NOT NULL,                    
    CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),         
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,           
    ProductID INT,                           
    QuantityInStock INT NOT NULL,             
    LastStockUpdate DATETIME NOT NULL,       
    CONSTRAINT FK_ProductID_Inventory FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
);

--3 create an ERD for database


-- 4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.--
ALTER TABLE OrderDetails
ALTER COLUMN OrderID INT NOT NULL;

ALTER TABLE OrderDetails
ALTER COLUMN ProductID INT NOT NULL;

SELECT name 
FROM sys.foreign_keys 
WHERE parent_object_id = OBJECT_ID('OrderDetails') 
  AND referenced_object_id = OBJECT_ID('Orders');

ALTER TABLE OrderDetails
DROP CONSTRAINT FK_OrderID;

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderID FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID) ON DELETE CASCADE;

-- OrderID is a foreign key referencing the OrderID in the Orders table with a CASCADE DELETE. This means if an order is deleted, all related OrderDetails entries are automatically deleted. --
ALTER TABLE Products ADD Category VARCHAR(50);

-- 5. Insert at least 10 sample records into each of the following tables. --

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Ravi', 'Sharma', 'ravi.sharma@example.com', '9876543210', '123 Connaught Place, Delhi'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', '8765432109', '456 MG Road, Mumbai'),
(3, 'Amit', 'Verma', 'amit.verma@example.com', '7654321098', '789 Brigade Road, Bangalore'),
(4, 'Sneha', 'Reddy', 'sneha.reddy@example.com', '6543210987', '101 Park Street, Kolkata'),
(5, 'Vikram', 'Mehta', 'vikram.mehta@example.com', '5432109876', '202 Camp, Pune'),
(6, 'Anjali', 'Kumar', 'anjali.kumar@example.com', '4321098765', '303 Banjara Hills, Hyderabad'),
(7, 'Nisha', 'Patel', 'nisha.patel@example.com', '3210987654', '404 Ashok Nagar, Jaipur'),
(8, 'Karan', 'Chopra', 'karan.chopra@example.com', '2109876543', '505 Sarjapur Road, Bangalore'),
(9, 'Deepak', 'Agarwal', 'deepak.agarwal@example.com', '1098765432', '606 Malviya Nagar, Delhi'),
(10, 'Isha', 'Bansal', 'isha.bansal@example.com', '0987654321', '707 Jayanagar, Bangalore'),
(11, 'Rohit', 'Kapoor', 'rohit.kapoor@example.com', '0987651234', '808 Nehru Place, Delhi'),
(12, 'Manisha', 'Nair', 'manisha.nair@example.com', '0987655678', '909 Andheri West, Mumbai'),
(13, 'Rahul', 'Chopra', 'rahul.chopra@example.com', '0987658901', '707 Park Lane, Bangalore'),
(14, 'Sneha', 'Iyer', 'sneha.iyer@example.com', '9876512340', '202 Church Street, Chennai'),
(15, 'Abhishek', 'Pandey', 'abhishek.pandey@example.com', '9876509876', '606 DLF Phase 3, Gurgaon'),
(16, 'Neha', 'Gupta', 'neha.gupta@example.com', '9876598765', '404 Salt Lake City, Kolkata'),
(17, 'Kunal', 'Jain', 'kunal.jain@example.com', '8765432190', '303 Laxmi Nagar, Delhi'),
(18, 'Ritika', 'Rao', 'ritika.rao@example.com', '7654321987', '202 Hinjawadi, Pune'),
(19, 'Gaurav', 'Shah', 'gaurav.shah@example.com', '6543219876', '101 Rajouri Garden, Delhi'),
(20, 'Sonali', 'Deshmukh', 'sonali.deshmukh@example.com', '5432109871', '202 Koregaon Park, Pune'),
(21, 'Raj', 'Mehta', 'raj.mehta@example.com', '9876541231', '909 Hiranandani, Mumbai'),
(22, 'Arjun', 'Khanna', 'arjun.khanna@example.com', '8765432108', '303 Patel Nagar, Delhi'),
(23, 'Ishita', 'Bhatia', 'ishita.bhatia@example.com', '7654321099', '707 Jubilee Hills, Hyderabad'),
(24, 'Vivek', 'Rana', 'vivek.rana@example.com', '6543210986', '505 Civil Lines, Jaipur'),
(25, 'Swati', 'Patil', 'swati.patil@example.com', '5432109875', '303 Electronic City, Bangalore'),
(26, 'Aditi', 'Mishra', 'aditi.mishra@example.com', '4321098764', '202 Banjara Hills, Hyderabad'),
(27, 'Ajay', 'Yadav', 'ajay.yadav@example.com', '3210987652', '101 Marina Beach, Chennai'),
(28, 'Pooja', 'Sharma', 'pooja.sharma@example.com', '2109876545', '505 Greater Kailash, Delhi'),
(29, 'Suresh', 'Goyal', 'suresh.goyal@example.com', '1098765436', '707 Gachibowli, Hyderabad'),
(30, 'Tina', 'Kaul', 'tina.kaul@example.com', '0987654322', '909 MG Road, Mumbai');

-- Insert into Products with Category
INSERT INTO Products (ProductID, ProductName, Description, Price, Category) VALUES
(1, 'Laptop', '15-inch laptop with high performance', 1200.00, 'Electronics'),
(2, 'Smartphone', 'Latest smartphone model with advanced features', 800.00, 'Electronics'),
(3, 'Headphones', 'Noise-cancelling over-ear headphones', 150.00, 'Accessories'),
(4, 'Tablet', '10-inch tablet with stylus support', 400.00, 'Electronics'),
(5, 'Smartwatch', 'Water-resistant smartwatch with fitness tracking', 250.00, 'Wearable'),
(6, 'Camera', 'DSLR camera with 24MP sensor', 900.00, 'Electronics'),
(7, 'Bluetooth Speaker', 'Portable Bluetooth speaker with high bass', 100.00, 'Accessories'),
(8, 'External Hard Drive', '1TB external hard drive for storage', 120.00, 'Accessories'),
(9, 'USB-C Hub', 'Multi-port USB-C hub for connectivity', 50.00, 'Accessories'),
(10, 'Wireless Charger', 'Fast wireless charging pad', 30.00, 'Accessories'),
(11, 'Gaming Laptop', 'High-end gaming laptop with powerful GPU', 1500.00, 'Electronics'),
(12, 'Smart TV', '55-inch 4K Smart TV with HDR', 1000.00, 'Electronics'),
(13, 'Wireless Earbuds', 'Bluetooth 5.0 wireless earbuds with charging case', 120.00, 'Accessories'),
(14, 'Fitness Tracker', 'Fitness tracker with heart rate monitor', 200.00, 'Wearable'),
(15, 'Laptop Stand', 'Adjustable laptop stand for better ergonomics', 50.00, 'Accessories'),
(16, 'Digital Camera', 'Compact digital camera with 20MP resolution', 400.00, 'Electronics'),
(17, 'Bluetooth Mouse', 'Wireless Bluetooth mouse with ergonomic design', 40.00, 'Accessories'),
(18, 'Gaming Chair', 'Ergonomic gaming chair with lumbar support', 300.00, 'Furniture'),
(19, 'Air Purifier', 'HEPA air purifier with smart features', 250.00, 'Home Appliances'),
(20, 'Monitor', '27-inch 144Hz gaming monitor', 450.00, 'Electronics'),
(21, 'Smart Lock', 'Smart door lock with fingerprint recognition', 200.00, 'Home Security'),
(22, 'Wireless Router', 'Wi-Fi 6 dual-band router with high speed', 150.00, 'Networking'),
(23, 'Keyboard', 'Mechanical keyboard with RGB lighting', 100.00, 'Accessories'),
(24, 'Projector', 'Portable mini projector for home theater', 300.00, 'Electronics'),
(25, 'Electric Scooter', 'Foldable electric scooter with long battery life', 800.00, 'Transportation'),
(26, 'Electric Kettle', 'Electric kettle with temperature control', 60.00, 'Home Appliances'),
(27, 'VR Headset', 'Virtual reality headset with controllers', 350.00, 'Electronics'),
(28, 'Smart Mirror', 'Smart mirror with voice control and touch screen', 500.00, 'Home Appliances'),
(29, 'Drone', 'Quadcopter drone with 4K camera', 600.00, 'Electronics'),
(30, 'Portable Power Bank', '20000mAh power bank with fast charging', 80.00, 'Accessories');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-09-01', 1200.00),
(2, 2, '2024-09-02', 800.00),
(3, 3, '2024-09-03', 150.00),
(4, 4, '2024-09-04', 400.00),
(5, 5, '2024-09-05', 250.00),
(6, 6, '2024-09-06', 900.00),
(7, 7, '2024-09-07', 100.00),
(8, 8, '2024-09-08', 120.00),
(9, 9, '2024-09-09', 50.00),
(10, 10, '2024-09-10', 30.00),
(11, 11, '2024-09-11', 1500.00),
(12, 12, '2024-09-12', 1000.00),
(13, 13, '2024-09-13', 120.00),
(14, 14, '2024-09-14', 200.00),
(15, 15, '2024-09-15', 50.00),
(16, 16, '2024-09-16', 400.00),
(17, 17, '2024-09-17', 40.00),
(18, 18, '2024-09-18', 300.00),
(19, 19, '2024-09-19', 250.00),
(20, 20, '2024-09-20', 450.00),
(21, 21, '2024-09-21', 200.00),
(22, 22, '2024-09-22', 150.00),
(23, 23, '2024-09-23', 100.00),
(24, 24, '2024-09-24', 300.00),
(25, 25, '2024-09-25', 800.00),
(26, 26, '2024-09-26', 60.00),
(27, 27, '2024-09-27', 350.00),
(28, 28, '2024-09-28', 500.00),
(29, 29, '2024-09-29', 600.00),
(30, 30, '2024-09-30', 80.00);

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1),
(11, 11, 11, 1),
(12, 12, 12, 1),
(13, 13, 13, 1),
(14, 14, 14, 1),
(15, 15, 15, 1),
(16, 16, 16, 1),
(17, 17, 17, 1),
(18, 18, 18, 1),
(19, 19, 19, 1),
(20, 20, 20, 1),
(21, 21, 21, 1),
(22, 22, 22, 1),
(23, 23, 23, 1),
(24, 24, 24, 1),
(25, 25, 25, 1),
(26, 26, 26, 1),
(27, 27, 27, 1),
(28, 28, 28, 1),
(29, 29, 29, 1),
(30, 30, 30, 1);

-- Insert into Inventory
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 100, '2024-09-01'),
(2, 2, 200, '2024-09-02'),
(3, 3, 150, '2024-09-03'),
(4, 4, 75, '2024-09-04'),
(5, 5, 120, '2024-09-05'),
(6, 6, 60, '2024-09-06'),
(7, 7, 90, '2024-09-07'),
(8, 8, 300, '2024-09-08'),
(9, 9, 400, '2024-09-09'),
(10, 10, 500, '2024-09-10'),
(11, 11, 80, '2024-09-11'),
(12, 12, 70, '2024-09-12'),
(13, 13, 250, '2024-09-13'),
(14, 14, 100, '2024-09-14'),
(15, 15, 130, '2024-09-15'),
(16, 16, 110, '2024-09-16'),
(17, 17, 180, '2024-09-17'),
(18, 18, 90, '2024-09-18'),
(19, 19, 160, '2024-09-19'),
(20, 20, 100, '2024-09-20'),
(21, 21, 140, '2024-09-21'),
(22, 22, 150, '2024-09-22'),
(23, 23, 200, '2024-09-23'),
(24, 24, 180, '2024-09-24'),
(25, 25, 60, '2024-09-25'),
(26, 26, 150, '2024-09-26'),
(27, 27, 80, '2024-09-27'),
(28, 28, 100, '2024-09-28'),
(29, 29, 90, '2024-09-29'),
(30, 30, 200, '2024-09-30');

select * from Customers
select * from Inventory
select * from OrderDetails
select * from Orders
select * from Products


--Task 2
--1. Write an SQL query to retrieve the names and emails of all customers--
SELECT FirstName, LastName, Email
FROM Customers;

--2 Write an SQL query to list all orders with their order dates and corresponding customer  names.--

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

-- 3. Write an SQL query to insert a new customer record into the "Customers" table. Include
-- customer information such as name, email, and address. --


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (31, 'Rahul', 'Kapoor', 'rahul.kapoor@example.com', '9871234567', '123 New Colony, Delhi');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
-- increasing them by 10%. --

select * from Products

UPDATE Products
SET Price = Price * 1.10

--5 . Write an SQL query to delete a specific order and its associated order details from the
-- "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter --
DELETE FROM Orders
WHERE OrderID = 5;

select * from OrderDetails ;
select * from Orders ;

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
--order date, and any other necessary information--

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (31, 3, '2024-09-15', 500.00);
select * from Orders ;

--7 Write an SQL query to update the contact information (e.g., email and address) of a specific
--customer in the "Customers" table. Allow users to input the customer ID and new contact information.--

UPDATE Customers
SET Email = 'amit.newemail@example.com',
    Address = '123 New Layout, Bangalore'
WHERE CustomerID = 3;

select * from Customers ;

--8 . Write an SQL query to recalculate and update the total cost of each order in the "Orders"
-- table based on the prices and quantities in the "OrderDetails" table --
UPDATE Orders
SET TotalAmount = ISNULL((
    SELECT SUM(OD.Quantity * P.Price)
    FROM OrderDetails OD
    JOIN Products P ON OD.ProductID = P.ProductID
    WHERE OD.OrderID = Orders.OrderID
), 0);

select * from Orders ;

--9 . Write an SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

DELETE FROM Orders
WHERE CustomerID = 4;

--10 Write an SQL query to insert a new electronic gadget product into the "Products" table,
--including product name, category, price, and any other relevant details.

select * from Products


INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES (31, 'Wireless Earbuds', 'High-quality wireless earbuds with noise cancellation.', 1900);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.


select * from Orders

ALTER TABLE Orders
ADD status VARCHAR(20);

UPDATE orders
SET status = CASE
    WHEN OrderID = 1 THEN 'Pending'
    WHEN OrderID = 2 THEN 'Shipped'
    WHEN OrderID = 3 THEN 'Delivered'
    WHEN OrderID = 4 THEN 'Processing'
    WHEN OrderID = 5 THEN 'Shipped'
    WHEN OrderID = 6 THEN 'Pending'
    WHEN OrderID = 7 THEN 'Processing'
    WHEN OrderID = 8 THEN 'On Hold'
    WHEN OrderID = 9 THEN 'Completed'
    WHEN OrderID = 10 THEN 'Cancelled'
    WHEN OrderID = 11 THEN 'Returned'
    WHEN OrderID = 12 THEN 'Delivered'
    WHEN OrderID = 13 THEN 'Shipped'
    WHEN OrderID = 14 THEN 'Processing'
    WHEN OrderID = 15 THEN 'On Hold'
    WHEN OrderID = 16 THEN 'Pending'
    WHEN OrderID = 17 THEN 'Processing'
    WHEN OrderID = 18 THEN 'Shipped'
    WHEN OrderID = 19 THEN 'Completed'
    WHEN OrderID = 20 THEN 'Pending'
    WHEN OrderID = 21 THEN 'On Hold'
    WHEN OrderID = 22 THEN 'Delivered'
    WHEN OrderID = 23 THEN 'Processing'
    WHEN OrderID = 24 THEN 'Shipped'
    WHEN OrderID = 25 THEN 'Pending'
    WHEN OrderID = 26 THEN 'Cancelled'
    WHEN OrderID = 27 THEN 'On Hold'
    WHEN OrderID = 28 THEN 'Processing'
    WHEN OrderID = 29 THEN 'Shipped'
    WHEN OrderID = 30 THEN 'Completed'
END;


UPDATE Orders
SET status = 'Shipped' 
WHERE OrderID = 1;   


--12. Write an SQL query to calculate and update the number of orders placed by each customer
--in the "Customers" table based on the data in the "Orders" table

select * from Customers

ALTER TABLE Customers
ADD NumberOfOrders INT DEFAULT 0;

UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);


-- Task 3 ;
-- 1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order

SELECT 
    o.OrderID,
    o.OrderDate,
    o.Status,
    c.CustomerID,
    c.FirstName,
	c.LastName,
    c.Email
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID;


--2. Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.

SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE p.Category = 'Electronics'  -- Assuming the Category is stored as a string
GROUP BY p.ProductName;

--3. Write an SQL query to list all customers who have made at least one purchase. Include their
-- names and contact information.
SELECT DISTINCT 
    c.CustomerID,
    c.FirstName,
	c.LastName,
    c.Email,
    c.Phone
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
-- total quantity ordered. Include the product name and the total quantity ordered.

SELECT TOP 1
    p.ProductID,
    p.ProductName,
	SUM(od.Quantity) AS TotalQuantity
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductID, p.ProductName
ORDER BY 
    SUM(od.Quantity) DESC
;

select * from OrderDetails

-- 5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.SELECT ProductName, Category
FROM Products
WHERE Category = 'Electronics';

-- 6. Write an SQL query to calculate the average order value for each customer. Include the
-- customer's name and their average order value

SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

--7 Write an SQL query to find the order with the highest total revenue. Include the order ID,
--customer information, and the total revenue.

SELECT TOP 1
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.TotalAmount AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

SELECT 
    p.ProductName,
    COUNT(od.Quantity) AS NumberOfOrders
FROM 
    Products p
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
JOIN 
    Orders o ON od.OrderID = o.OrderID
WHERE 
    p.Category = 'Electronics' 
GROUP BY 
    p.ProductName;


--9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
-- Allow users to input the product name as a parameter.

SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    p.ProductName = 'Camera'; 

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.


SELECT 
    SUM(TotalAmount) AS TotalRevenue
FROM 
    Orders o
WHERE 
    o.OrderDate BETWEEN '2024-09-03' AND '2024-09-08';  

--Task 4 
--1 . Write an SQL query to find out which customers have not placed any orders

SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.OrderID IS NULL; 

--2. Write an SQL query to find the total number of products available for sale. 
SELECT 
    COUNT(*) AS TotalProducts
FROM 
    Products

--3. Write an SQL query to calculate the total revenue generated by TechShop. 

SELECT 
    SUM(TotalAmount) AS TotalRevenue
FROM 
    Orders

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.

SELECT 
    p.Category,
    AVG(od.Quantity) AS AverageQuantityOrdered
FROM 
    Products p
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
WHERE 
    p.Category = 'Electronics'
GROUP BY 
    p.Category;

--5 .Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = 3;

--6. Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.

SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName
HAVING COUNT(O.OrderID) = (
    SELECT MAX(OrderCount)
    FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY CustomerID
    ) AS OrderCounts
);

--7. Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.

SELECT TOP 1
    p.Category,
    SUM(od.Quantity) AS TotalQuantityOrdered
FROM 
    Products p
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
JOIN 
    Orders o ON od.OrderID = o.OrderID
GROUP BY 
    p.Category
ORDER BY 
    TotalQuantityOrdered DESC;

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
-- on electronic gadgets. List their name and total spending.

SELECT TOP 1
    c.FirstName,
    c.LastName,
    SUM(od.Quantity * p.Price) AS TotalSpending
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    p.Category = 'Electronics' 
GROUP BY 
    c.FirstName, c.LastName
ORDER BY 
    TotalSpending DESC;

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.
select * from Orders

select avg(TotalAmount) as average_order_value
from Orders


--10. Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.

SELECT 
    c.FirstName,
	c.LastName,
    COUNT(o.OrderID) AS total_orders
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.FirstName , c.LastName
ORDER BY 
    total_orders DESC;



