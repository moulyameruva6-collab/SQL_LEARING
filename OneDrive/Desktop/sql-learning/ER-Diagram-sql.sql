create database eccomerce;
use eccomerce;

create table users(
user_id bigint auto_increment primary key,
username varchar(50),
email varchar(100),
password varchar(225),
role enum("admin","user"),
active boolean default True,
create_at timestamp default current_timestamp,
update_at timestamp default current_timestamp on update current_timestamp,
ph varchar(15),
date_of_birth date,
gender varchar(30),
profilename varchar(255),
profilepath varchar(255));

create table product(
p_id bigint auto_increment primary key,
p_name varchar(50),
p_price decimal(10,2),
quantity int,
image varchar(255),
description text,
selling_price decimal(10,2),
create_at timestamp default current_timestamp,
update_at timestamp default current_timestamp on update current_timestamp,
category varchar(50),
storedpath varchar(255),
active boolean default True);

create table orders(
order_id bigint auto_increment primary key,
user_id bigint,
create_at timestamp default current_timestamp,
order_status varchar(50),
address varchar(255),
foreign key (user_id) references users(user_id));

create table orders_details(
order_id bigint,
p_id bigint,
foreign key (order_id) references orders(order_id),
foreign key (p_id) references product(p_id),
quantity int,
price decimal(10,2),
total_price decimal(10,2));

create table payments(
payment_id bigint AUTO_INCREMENT PRIMARY KEY,
user_id bigint,
order_id bigint,
foreign key (user_id) references users(user_id),
foreign key (order_id) references orders(order_id),
status varchar(30),
amount decimal(10,2),
type varchar(40),
create_at timestamp default current_timestamp);

DROP DATABASE ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

show tables;
SELECT * FROM users;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM orders_details;
SELECT * FROM payments;












 

