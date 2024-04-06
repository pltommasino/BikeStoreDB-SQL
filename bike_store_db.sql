#In order to make the query work, you have to:
#
#--enable LOCAL INFILE, you must do 2 things:
#  --1--if you are using MySQL Workbench you can go, in the Instances Home-Page, to the MySQL Connections settings -> open the Advanced tab ->
#       -> add, in the box called Others, this line: OPT_LOCAL_INFILE=1
#  --2--from a generic query tab you have to ensure that the variable local_infile is set to TRUE. To view to actual value you can use the following command:
#		SHOW GLOBAL VARIABLES LIKE 'local_infile'; to set to true the variable you can use this command: SET GLOBAL local_infile = true
#
#--disable Safe Updates:
#  --if you are using MySQL Workbench you can go to Edit -> Preferences -> SQL Editor and uncheck the Safe Updates option
#
#--write the correct path-to-files on your client system (local machine) in the LOAD DATA statements


DROP DATABASE IF EXISTS Bike_store; #Added
#creating the Bike_store database
CREATE DATABASE Bike_store;

#switching to the Bike_store database
USE Bike_store;

#creating brands table
CREATE TABLE Brands 
( 
Brand_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Brand_name VARCHAR(20) UNIQUE
);

#creating categories table
CREATE TABLE Categories
(
Category_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Category_name VARCHAR(20) UNIQUE
);

#creating customers table
CREATE TABLE Customers
(
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
First_name VARCHAR(20),
Last_name VARCHAR(20),
Phone VARCHAR(20),
E_mail VARCHAR(40), #Modified
Street VARCHAR(30),
City VARCHAR(30), #Modified
State VARCHAR(5),
Zip_code INT
);

#creating order_items table
CREATE TABLE Order_items
(
Order_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Item_ID INT UNIQUE,
Product_ID INT UNIQUE,
Quantity INT,
List_price FLOAT,
Discount FLOAT
);

#creating orders table
CREATE TABLE Orders
(
Order_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Customer_ID INT UNIQUE,
Order_status INT,
Order_date DATE,
Required_date DATE,
Shipped_date DATE,
Store_ID INT,
Staff_ID INT
);

#creating products table
CREATE TABLE Products
(
Product_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Product_name VARCHAR(60), #modified
Brand_ID INT,
Category_ID INT,
Model_year INT,
List_price FLOAT
);

#creating staffs table
CREATE TABLE Staffs
(
Staff_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
First_name VARCHAR(20),
Last_name VARCHAR(20),
E_mail VARCHAR(30),
Phone VARCHAR(20),
Activ INT,
Store_ID INT,
Manager_ID INT
);

#creating stocks table
CREATE TABLE Stocks
(
Store_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Product_ID INT,
Quantity INT
);

#creating stores table
CREATE TABLE Stores
(
Store_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Store_name VARCHAR(20),
Phone VARCHAR(20),
E_mail VARCHAR(30),
Street VARCHAR(30),
City VARCHAR(20),
State VARCHAR(5),
Zip_code INT
);

#importing brands data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/brands.csv'
INTO TABLE Brands
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing categories data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/categories.csv'
INTO TABLE Categories
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing customer data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing order_items data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/order_items.csv'
INTO TABLE Order_items
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing orders data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing products data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/products.csv'
INTO TABLE Products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing staffs data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/staffs.csv'
INTO TABLE Staffs
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing stocks data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/stocks.csv'
INTO TABLE Stocks
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#importing stores data
LOAD DATA LOCAL INFILE '/Users/pasquale/Documents/MySQL/DMDS/HW1/data/stores.csv'
INTO TABLE Stores
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;  
