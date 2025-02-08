CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

INSERT INTO Customers (customer_id, name, phone, email, address) VALUES
(1, 'Ahmed Mohamed', '0123456789', 'ahmed@email.com', 'Cairo, Egypt'),
(2, 'Sara Ali', '0112233445', 'sara@email.com', 'Alexandria, Egypt'),
(3, 'Khaled Ibrahim', '0109988776', 'khaled@email.com', 'Giza, Egypt'),
(4, 'Mona Hassan', '0156677889', 'mona@email.com', 'Tanta, Egypt');

select * from Customers

INSERT INTO Customers (customer_id, name, phone, email, address) VALUES
(5, 'salim', '0987654321', 'salim@email.com', 'Cairo, Egypt'),
(6, 'Ali kilani', '1324756890', 'ali@email.com', 'saeide, Egypt'),
(7, 'rana sayde', '00894657324', 'roro@email.com', 'maniya, Egypt');
UPDATE Customers
SET name = 'Ahmed Mohamed', phone = '0123456789', email = 'ahmed@email.com', address = 'Cairo, Egypt'
WHERE customer_id = 1;

CREATE TABLE Menu_Items (
  item_id INT PRIMARY KEY,
  name VARCHAR(100),
  description VARCHAR(100),
  price DECIMAL(10,2),
  category VARCHAR(15),
  availability VARCHAR(15)
);

INSERT INTO Menu_Items (item_id, name, description, price, category, availability) VALUES
(1, 'Margherita Pizza', 'Pizza with cheese and fresh tomatoes', 80.00, 'Main Course', 'Available'),
(2, 'Beef Burger', 'Beef burger with cheese and vegetables', 60.00, 'Main Course', 'Available'),
(3, 'Caesar Salad', 'Grilled chicken salad with Caesar dressing', 50.00, 'Salads', 'Available'),
(4, 'Cappuccino', 'Coffee with milk and foam', 30.00, 'Drinks', 'Available');
select * from Menu_Items



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,  
    customer_id INT,  
    order_date DATETIME,
    total_price DECIMAL(10,2),
    status VARCHAR(20),

    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_price, status) VALUES
(101, 1, '2024-01-30 18:45:00', 140.00, 'Preparing'),
(102, 2, '2024-01-30 19:10:00', 80.00, 'Ready'),
(103, 3, '2024-01-30 19:30:00', 60.00, 'Delivered');

SELECT * FROM Orders

CREATE TABLE Orders_Details (
    order_details_id INT PRIMARY KEY,  
    order_id INT, 
	item_id INT,
    quantity INT,
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	CONSTRAINT fk_Menu_Items FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)

);
INSERT INTO Orders_Details (order_details_id, order_id, item_id, quantity) VALUES
(1, 101, 1, 1),  -- Margherita Pizza
(2, 101, 4, 2),  -- Cappuccino
(3, 102, 2, 1),  -- Beef Burger
(4, 102, 3, 1);  -- Caesar Salad
SELECT * FROM Orders_Details




CREATE TABLE Employees (
    employees_id INT PRIMARY KEY,  
        name VARCHAR(100),
    position VARCHAR(50),
	    phone VARCHAR(15),
		salary DECIMAL(10,2),
);

INSERT INTO Employees (employees_id, name, position, phone, salary) VALUES
(1, 'Mohamed Samir', 'Waiter', '0101234567', 5000.00),
(2, 'Iman Abdallah', 'Chef', '0123456789', 7000.00),
(3, 'Hossam El-Dessouki', 'Manager', '0112233445', 10000.00);

select * from Employees

CREATE TABLE Inventory (
      inventory_id INT PRIMARY KEY,  
      item_name VARCHAR(100),
       quantity Bigint,
	   supplier varchar(100),
		last_updated datetime
);

INSERT INTO Inventory (inventory_id, item_name, quantity, supplier, last_updated) VALUES
(1, 'Flour', 50, 'Egyptian Mills Company', '2024-01-29'),
(2, 'Mozzarella Cheese', 20, 'Dairy Supplier', '2024-01-29'),
(3, 'Beef Meat', 15, 'Local Farms', '2024-01-28'),
(4, 'Tomatoes', 30, 'Green Farms', '2024-01-30');

select * from Inventory


CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    table_number INT,
    reservation_date DATETIME,
    status VARCHAR(50),
    CONSTRAINT fk_customer_reservation FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Reservations (reservation_id, customer_id, table_number, reservation_date, status) VALUES
(1, 1, 5, '2024-02-01 20:00:00', 'Confirmed'),
(2, 2, 3, '2024-02-02 19:30:00', 'Confirmed'),
(3, 3, 2, '2024-02-03 21:00:00', 'Canceled');

select * from Reservations


CREATE TABLE Payments (
      payment_id INT PRIMARY KEY,  
	  order_id INT,
	  payment_method varchar(100),
	  amount DECIMAL(10,2),
	  payment_status varchar(50),
	   CONSTRAINT fk_order_Payments FOREIGN KEY (order_id) REFERENCES Orders(order_id),

);

INSERT INTO Payments (payment_id, order_id, payment_method, amount, payment_status) VALUES
(1, 101, 'Credit Card', 140.00, 'Paid'),
(2, 102, 'Cash', 80.00, 'Paid'),
(3, 103, 'E-Wallet', 60.00, 'Paid');

SELECT * FROM Payments


select * from Customers
select * from Menu_Items
SELECT * FROM Orders
SELECT * FROM Orders_Details
select * from Employees
select * from Inventory
select * from Reservations
SELECT * FROM Payments
