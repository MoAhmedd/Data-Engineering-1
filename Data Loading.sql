DROP SCHEMA IF EXISTS brazil_fooddelivery;
CREATE SCHEMA brazil_fooddelivery;
USE brazil_fooddelivery;

SET GLOBAL local_infile= 'ON';
show variables like "local_infile";

-- Channels
DROP TABLE IF EXISTS channels;
CREATE TABLE channels(
	channel_id INT,
	channel_name VARCHAR(255),
	channel_type VARCHAR(255),
	PRIMARY KEY (channel_id)
);


load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/channels.csv'
into table channels
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(channel_id, channel_name, channel_type);


-- Orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	order_id INT,
	store_id INT,
	channel_id INT,
	payment_order_id INT,
	delivery_order_id INT,
	order_status VARCHAR(255),
	order_amount INT,
	order_delivery_fee INT,
	order_delivery_cost INT,
	order_created_day INT,
	order_created_month VARCHAR(100),
	order_created_year INT,
	order_moment_created DATETIME, 
    PRIMARY KEY (order_id),
	KEY channel_id(channel_id),
	KEY store_id(store_id),
	CONSTRAINT orders_ibfk_1 FOREIGN KEY(channel_id) references channels(channel_id)
);

load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/orders.csv'
into table orders
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(order_id, store_id, channel_id, payment_order_id, delivery_order_id, order_status, order_amount, order_delivery_fee, order_delivery_cost, order_created_day, order_created_month, order_created_year, order_moment_created);

-- Deliveries
DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries(
	delivery_id INT,
	delivery_order_id INT,
	driver_id INT,
	delivery_distance_meters INT,
	delivery_status VARCHAR(255),
	PRIMARY KEY (delivery_id)
);


load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/deliveries.csv'
into table deliveries
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(delivery_id, delivery_order_id, driver_id, delivery_distance_meters, delivery_status);

-- Drivers
DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers(
	driver_id INT,
	driver_modal VARCHAR(255),
	driver_type VARCHAR(255),
	PRIMARY KEY (driver_id)
);


load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/drivers.csv'
into table drivers
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(driver_id, driver_modal, driver_type);

-- Payments
DROP TABLE IF EXISTS payments;
CREATE TABLE payments(
	payment_id INT,
	payment_order_id INT,
	payment_amount INT,
	payment_fee INT,
	payment_method VARCHAR(255),
	payment_status VARCHAR(50),
	PRIMARY KEY (payment_id)
);


load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/payments.csv'
into table payments
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(payment_id, payment_order_id, payment_amount, payment_fee, payment_method, payment_status);

-- Hubs
DROP TABLE IF EXISTS hubs;
CREATE TABLE hubs (
hub_id INT,
hub_name VARCHAR(255),
hub_city VARCHAR(255),
hub_state VARCHAR(30),
hub_latitude INT,
hub_longitude INT,
PRIMARY KEY (hub_id)
);


load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/hubs.csv'
into table hubs
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(hub_id, hub_name, hub_city, hub_state, hub_latitude, hub_longitude);


-- Stores
DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
	store_id INT,
	hub_id INT,
	store_name VARCHAR(255),
	store_segment VARCHAR(255),
	store_plan_price INT,
	store_latitude INT,
	store_longitude INT,
	PRIMARY KEY (store_id), 
	KEY hub_id(hub_id),
	FOREIGN KEY (hub_id) REFERENCES hubs(hub_id)
);


load data local infile '/Users/Ahmed/Desktop/brazil_fooddelivery/stores.csv'
into table stores
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(store_id, hub_id, store_name, store_segment, store_plan_price, store_latitude, store_longitude);




