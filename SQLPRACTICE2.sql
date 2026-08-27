CREATE DATABASE online_food_delivery;
 USE online_food_delivery;
 
 CREATE TABLE customers(
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 email VARCHAR(100) NOT NULL UNIQUE,
 phone VARCHAR(15) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 gender VARCHAR(10),
 date_of_birth DATE, 
 city VARCHAR(50) NOT NULL,
 state VARCHAR(50) NOT NULL,
 pincode VARCHAR(10) NOT NULL,
 address VARCHAR(255) NOT NULL,
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 status VARCHAR(20) DEFAULT 'Active'
 );
 DESC customers;
 
 CREATE TABLE restaurants(
 restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
 restaurant_name VARCHAR(100) NOT NULL,
 owner_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE,
 phone VARCHAR(15) UNIQUE,
 city VARCHAR(50) NOT NULL,
 address VARCHAR(255) NOT NULL,
 opening_time TIME,
 closing_time TIME,
 rating DECIMAL(2,1) DEFAULT 0,
 gst_number VARCHAR(30) UNIQUE,
 status VARCHAR(30) DEFAULT 'Open'
);
DESC restaurants;
SHOW TABLES;

CREATE TABLE categories(
 category_id INT AUTO_INCREMENT PRIMARY KEY,
 category_name VARCHAR(50) NOT NULL UNIQUE,
 description VARCHAR(255)
 );
 DESC categories;
 
 CREATE TABLE delivery_partners(
 partner_id INT AUTO_INCREMENT PRIMARY KEY,
 partner_name VARCHAR(100) NOT NULL,
 phone VARCHAR(15) NOT NULL UNIQUE,
 email VARCHAR(100) UNIQUE,
 vehicle_number VARCHAR(20) UNIQUE,
 vehicle_type VARCHAR(30) NOT NULL,
 license_number VARCHAR(30) UNIQUE,
 joining_date DATE NOT NULL,
 city VARCHAR(50) NOT NULL,
 status VARCHAR(20) DEFAULT 'Available' 
 );
 DESC delivery_partners;
 SHOW TABLES;
 
 CREATE TABLE menu(
 menu_id INT AUTO_INCREMENT PRIMARY KEY,
 restaurant_id INT NOT NULL,
 category_id INT NOT NULL,
 item_name VARCHAR(100) NOT NULL,
 description VARCHAR(255),
 price DECIMAL(10,2) NOT NULL CHECK(price > 0),
 is_veg BOOLEAN NOT NULL,
 preparation_time INT,
 availability BOOLEAN DEFAULT TRUE,
 FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
 FOREIGN KEY (category_id) REFERENCES categories(category_id)
 );
 DESC menu;
 SHOW TABLES;
 
 CREATE TABLE orders(
 order_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 restaurant_id INT NOT NULL, 
 delivery_partner_id INT,
 order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 total_amount DECIMAL(10,2) NOT NULL,
 delivery_charge DECIMAL(10,2) DEFAULT 0,
 discount DECIMAL(10,2) DEFAULT 0,
 tax DECIMAL(10,2) DEFAULT 0,
 final_amount DECIMAL(10,2) NOT NULL,
 order_status VARCHAR(30) DEFAULT 'Pending',
 payment_status VARCHAR(20) DEFAULT 'Pending',
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id),
 FOREIGN KEY(delivery_partner_id) REFERENCES delivery_partners(partner_id)
 );
 DESC orders;
 
 CREATE TABLE order_items(
 order_item_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT NOT NULL,
 menu_id INT NOT NULL,
 quantity INT NOT NULL,
 item_price DECIMAL(10,2) NOT NULL,
 total_price DECIMAL(10,2) NOT NULL,
 FOREIGN KEY(order_id) REFERENCES orders(order_id),
 FOREIGN KEY(menu_id) REFERENCES menu(menu_id)
 );
 
 DESC order_items;
 
 CREATE TABLE payments( 
 payment_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT NOT NULL UNIQUE,
 payment_method VARCHAR(30) NOT NULL,
 payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 transaction_id VARCHAR(100) UNIQUE,
 amount DECIMAL(10,2) NOT NULL,
 payment_status VARCHAR(20) DEFAULT 'Pending',
 FOREIGN KEY(order_id) REFERENCES orders(order_id)
 );
 DESC payments;
 CREATE TABLE ratings(
 rating_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 restaurant_id INT NOT NULL,
 order_id INT NOT NULL UNIQUE,
 rating INT NOT NULL CHECK(rating BETWEEN 1 AND 5),
 review VARCHAR(500),
 review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id),
 FOREIGN KEY(order_id) REFERENCES orders(order_id) 
 );
 DESC ratings;
 SHOW TABLES;
 
 INSERT INTO customers
(first_name, last_name, email, phone, password, gender, date_of_birth,
 city, state, pincode, address)
VALUES
('Moulya', 'Meruva', 'moulya@gmail.com', '9876543210', 'Moulya@123', 'Female',
 '2004-05-15', 'Eluru', 'Andhra Pradesh', '534001', 'Ramachandra Rao Peta'),

('Rahul', 'Kumar', 'rahul@gmail.com', '9876543211', 'Rahul@123', 'Male',
 '2003-08-20', 'Hyderabad', 'Telangana', '500001', 'Ameerpet'),

('Priya', 'Sharma', 'priya@gmail.com', '9876543212', 'Priya@123', 'Female',
 '2004-02-10', 'Vijayawada', 'Andhra Pradesh', '520001', 'Benz Circle'),

('Kiran', 'Reddy', 'kiran@gmail.com', '9876543213', 'Kiran@123', 'Male',
 '2003-11-25', 'Guntur', 'Andhra Pradesh', '522001', 'Brodipet'),

('Sneha', 'Rao', 'sneha@gmail.com', '9876543214', 'Sneha@123', 'Female',
 '2004-07-18', 'Visakhapatnam', 'Andhra Pradesh', '530001', 'MVP Colony');

SELECT * FROM customers;

INSERT INTO restaurants
(restaurant_name, owner_name, email, phone, city, address,
 opening_time, closing_time, rating, gst_number, status)
VALUES
('Paradise Restaurant', 'Ahmed Khan', 'paradise@gmail.com', '9000000001',
'Hyderabad', 'MG Road', '10:00:00', '23:00:00', 4.5, 'GSTHYD001', 'Open'),

('Dominos', 'Rahul Sharma', 'dominos@gmail.com', '9000000002',
'Vijayawada', 'Benz Circle', '11:00:00', '23:30:00', 4.2, 'GSTVJA002', 'Open'),

('Food Hub', 'Suresh Reddy', 'foodhub@gmail.com', '9000000003',
'Eluru', 'Powerpet', '09:00:00', '22:00:00', 4.0, 'GSTELR003', 'Closed'),

('Spice Kitchen', 'Kiran Rao', 'spicekitchen@gmail.com', '9000000004',
'Guntur', 'Brodipet', '10:30:00', '22:30:00', 4.3, 'GSTGNT004', 'Open'),

('Tasty Bites', 'Arjun Kumar', 'tastybites@gmail.com', '9000000005',
'Visakhapatnam', 'MVP Colony', '10:00:00', '23:00:00', 4.6, 'GSTVSK005', 'Open');

SELECT * FROM restaurants;

INSERT INTO categories
(category_name, description)
VALUES
('Biryani', 'Different varieties of biryani'),
('Pizza', 'Veg and non-veg pizzas'),
('Burger', 'Different types of burgers'),
('Desserts', 'Sweet dishes and desserts'),
('Beverages', 'Hot and cold beverages');
SELECT * FROM categories;

INSERT INTO delivery_partners
(partner_name, phone, email, vehicle_number, vehicle_type,
license_number, joining_date, city, status)
VALUES
('Ramesh', '9100000001', 'ramesh@gmail.com', 'AP01AB1234', 'Bike',
'LIC001', '2026-01-10', 'Eluru', 'Available'),

('Suresh', '9100000002', 'suresh@gmail.com', 'TS09CD5678', 'Bike',
'LIC002', '2026-01-15', 'Hyderabad', 'Available'),

('Arjun', '9100000003', 'arjun@gmail.com', 'AP05EF9012', 'Scooter',
'LIC003', '2026-02-05', 'Vijayawada', 'Available'),

('Vijay', '9100000004', 'vijay@gmail.com', 'AP06GH3456', 'Bike',
'LIC004', '2026-02-12', 'Guntur', 'Available'),

('Naveen', '9100000005', 'naveen@gmail.com', 'AP31IJ7890', 'Bike',
'LIC005', '2026-03-01', 'Visakhapatnam', 'Available');

SELECT * FROM delivery_partners;

INSERT INTO menu
(restaurant_id, category_id, item_name, description, price, is_veg, preparation_time, availability)
VALUES
(1, 1, 'Chicken Biryani', 'Hyderabadi chicken biryani', 250.00, FALSE, 30, TRUE),
(1, 2, 'Veg Pizza', 'Fresh vegetable pizza', 220.00, TRUE, 25, TRUE),
(1, 3, 'Chicken Burger', 'Spicy chicken burger', 180.00, FALSE, 20, TRUE),

(2, 2, 'Margherita Pizza', 'Classic cheese pizza', 200.00, TRUE, 20, TRUE),
(2, 3, 'Veg Burger', 'Fresh vegetable burger', 150.00, TRUE, 15, TRUE),
(2, 4, 'Chocolate Dessert', 'Chocolate sweet dessert', 120.00, TRUE, 10, TRUE),

(3, 1, 'Mutton Biryani', 'Traditional mutton biryani', 320.00, FALSE, 40, TRUE),
(3, 4, 'Gulab Jamun', 'Soft sweet gulab jamun', 100.00, TRUE, 10, TRUE),

(4, 1, 'Special Chicken Biryani', 'Spicy chicken biryani', 280.00, FALSE, 35, TRUE),
(4, 5, 'Fresh Lime Soda', 'Refreshing lime beverage', 80.00, TRUE, 5, TRUE),

(5, 3, 'Cheese Burger', 'Cheesy veg burger', 170.00, TRUE, 15, TRUE),
(5, 5, 'Cold Coffee', 'Chilled creamy coffee', 110.00, TRUE, 8, TRUE);

SELECT * FROM menu;
SELECT * FROM categories
ORDER BY category_id;

INSERT INTO orders
(customer_id, restaurant_id, delivery_partner_id,
 total_amount, delivery_charge, discount, tax, final_amount,
 order_status, payment_status)
VALUES
(1, 1, 1, 250.00, 40.00, 0.00, 25.00, 315.00,
 'Delivered', 'Paid'),

(2, 2, 2, 350.00, 40.00, 20.00, 33.00, 403.00,
 'Delivered', 'Paid'),

(3, 4, 4, 360.00, 30.00, 10.00, 36.00, 416.00,
 'Delivered', 'Paid'),

(4, 1, 2, 400.00, 40.00, 0.00, 40.00, 480.00,
 'Preparing', 'Paid'),

(5, 5, 3, 280.00, 35.00, 15.00, 28.00, 328.00,
 'Pending', 'Pending');

SELECT * FROM orders;

INSERT INTO order_items
(order_id, menu_id, quantity, item_price, total_price)
VALUES
(1, 1, 1, 250.00, 250.00),
(1, 2, 1, 220.00, 220.00),

(2, 4, 1, 200.00, 200.00),
(2, 5, 1, 150.00, 150.00),

(3, 9, 1, 280.00, 280.00),
(3, 10, 1, 80.00, 80.00),

(4, 1, 1, 250.00, 250.00),
(4, 3, 1, 180.00, 180.00),

(5, 11, 1, 170.00, 170.00),
(5, 12, 1, 110.00, 110.00);

SELECT * FROM order_items;

INSERT INTO payments
(order_id, payment_method, transaction_id, amount, payment_status)
VALUES
(1, 'UPI', 'TXN1001', 315.00, 'Paid'),
(2, 'Credit Card', 'TXN1002', 403.00, 'Paid'),
(3, 'UPI', 'TXN1003', 416.00, 'Paid'),
(4, 'Debit Card', 'TXN1004', 480.00, 'Paid'),
(5, 'Cash on Delivery', 'TXN1005', 328.00, 'Pending');

SELECT * FROM payments;

INSERT INTO ratings
(customer_id, restaurant_id, order_id, rating, review)
VALUES
(1, 1, 1, 5, 'Excellent food and fast delivery'),
(2, 2, 2, 4, 'Good food and service'),
(3, 4, 3, 5, 'Very tasty food and good delivery');

SELECT * FROM ratings;
 
 
 
 