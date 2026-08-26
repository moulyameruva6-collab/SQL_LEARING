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
 
 
 
 
 