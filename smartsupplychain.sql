USE supply_chain;
GO

/*CREATE TABLE category (
category_id int NOT NULL,
category_name nvarchar(50) NOT NULL);

CREATE TABLE order_details(
order_item_id int NOT NULL,
customer_id int NOT NULL,
city nvarchar(50) NOT NULL,
state nvarchar(50) NOT NULL,
country nvarchar(50) NOT NULL,
region nvarchar(50) NOT NULL,
market nvarchar(50) NOT NULL,
type_of_transaction nvarchar(50) NOT NULL,
order_date datetime2(7) NOT NULL,
order_status nvarchar(50) NOT NULL,
delivery_date datetime2(7) NOT NULL,
delivery_status nvarchar(50) NOT NULL,
late_delivery_risk tinyint NOT NULL,
schedule_shipment_day tinyint NOT NULL,
actual_shipment_day tinyint NOT NULL,
shipping_mode nvarchar(50) NOT NULL); 

CREATE TABLE order_item (
order_item_id int NOT NULL,
order_id int NOT NULL,
product_code int NOT NULL,
category_id int NOT NULL,
product_price numeric(7,2) NOT NULL,
order_quantity tinyint NOT NULL,
discount numeric(7,2) NOT NULL,
discount_rate numeric(7,2) NOT NULL,
profit_ratio numeric(7,2) NOT NULL,
profit_per_order numeric(7,2) NOT NULL,
sales_per_customer numeric(7,2) NOT NULL,
sales numeric(7,2) NOT NULL);

CREATE TABLE product (
product_code int NOT NULL,
product_name nvarchar(50) NOT NULL,
product_price numeric(7,2) NOT NULL,
product_status tinyint NOT NULL,
category_id int NOT NULL,
product_image nvarchar(100) NOT NULL);

CREATE TABLE customer(
customer_id int NOT NULL,
customer_name nvarchar(50) NOT NULL,
email nvarchar(50) NOT NULL,
c_password nvarchar(50) NOT NULL,
segment nvarchar(50) NOT NULL);

CREATE TABLE customer_store_address(
customer_id int NOT NULL, 
street nvarchar(50) NOT NULL,
city nvarchar(50) NOT NULL,
state nvarchar(50) NOT NULL,
zipcode int NULL,
country nvarchar(50) NOT NULL,
department_id tinyint NOT NULL,
department_name nvarchar(50) NOT NULL,
latitude decimal(18,15) NOT NULL,
longitude decimal(18,15) NOT NULL);

INSERT INTO category( category_id,category_name)
SELECT DISTINCT Category_Id,
       Category_Name
FROM dataCoSupplyC;

INSERT INTO customer( customer_id, customer_name,email,c_password,segment)
SELECT DISTINCT Customer_Id,
       CONCAT(Customer_Fname,' ',Customer_Lname),
	   Customer_Email,
	   Customer_Password,
	   Customer_Segment
FROM dataCoSupplyC;

INSERT INTO customer_store_address(customer_id,street,city,state,zipcode,country,department_id,department_name,latitude,longitude)
SELECT Customer_Id,
       Customer_Street,
	   Customer_City,
	   Customer_State,
	   Customer_Zipcode,
	   Customer_Country,
	   Department_Id,
	   Department_Name,
	   Latitude,
	   Longitude
FROM dataCoSupplyC;

INSERT INTO order_details(order_item_id,customer_id,city,state,country,region,market,type_of_transaction,order_date,order_status,delivery_date,delivery_status,late_delivery_risk,schedule_shipment_day,actual_shipment_day,shipping_mode)
SELECT Order_Item_Id,
       Customer_Id,
	   Order_City,
	   Order_State,
	   Order_Country,
	   Order_Region,
	   Market,
	   Type,
	   order_date_DateOrders,
	   Order_Status,
	   shipping_date_DateOrders,
	   Delivery_Status,
	   Late_delivery_risk,
	   Days_for_shipment_scheduled,
	   Days_for_shipping_real,
	   Shipping_Mode
FROM dataCoSupplyC;

INSERT INTO order_item(order_item_id,
                       order_id,
					   product_code,
					   category_id,
					   product_price,				  
					   order_quantity,
					   discount,
					   discount_rate,				 
					   profit_ratio,
					   profit_per_order,
					   sales_per_customer,
					   sales)
SELECT Order_Item_Id,
       Order_Id,
	   Product_Card_Id,
	   Product_Category_Id,
	   Product_Price,
	   Order_Item_Quantity,
	   Order_Item_Discount,
	   Order_Item_Discount_Rate,
	   Order_Item_Profit_Ratio,
	   Order_Profit_Per_Order,
	   Sales_per_customer,
	   Sales
FROM dataCoSupplyC; 

INSERT INTO product(product_code,product_name,product_price,product_status,category_id,product_image)
SELECT DISTINCT Product_Card_Id,
       Product_Name,
	   Product_Price,
	   Product_Status,
	   Category_Id,
	   Product_Image
FROM dataCoSupplyC;

SELECT TOP 100 * FROM order_item;
SELECT TOP 100 * FROM order_details;

ALTER TABLE order_item
ADD CONSTRAINT pk_orderitemID PRIMARY KEY (order_item_id); 

ALTER TABLE order_details
ADD CONSTRAINT fk_oiID FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id);

SELECT TOP 100 * FROM order_item oi
INNER JOIN order_details od
ON oi.order_item_id = od.order_item_id
ORDER BY oi.order_item_id;

ALTER TABLE product
ADD CONSTRAINT pk_productCode PRIMARY KEY (product_code); 

ALTER TABLE order_item
ADD CONSTRAINT fk_productCode FOREIGN KEY (product_code) REFERENCES product(product_code); 

SELECT TOP 10 * 
FROM order_item oi
INNER JOIN product p
ON oi.product_code = p.product_code; -- test the relation between order_item and product table.

ALTER TABLE category
ADD CONSTRAINT pk_categoryID PRIMARY KEY (category_id); 

SELECT TOP 1 * FROM order_item;

ALTER TABLE order_item
ADD CONSTRAINT fk_categoryid FOREIGN KEY (category_id) REFERENCES category(category_id); 

ALTER TABLE product
ADD CONSTRAINT fk_productcategoryid FOREIGN KEY (category_id) REFERENCES category(category_id); 

SELECT TOP 10 * FROM order_item oi
INNER JOIN category c
ON oi.category_id = c.category_id; -- test the relation between order_item and category table.

SELECT TOP 10 * FROM product p
INNER JOIN category c
ON p.category_id = c.category_id; -- test the relation between table category and product table.

ALTER TABLE customer 
ADD CONSTRAINT pk_customerid PRIMARY KEY (customer_id); 

ALTER TABLE order_details
ADD CONSTRAINT fk_customerID FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE customer_store_address 
ADD CONSTRAINT fk_CAcustomerid FOREIGN KEY (customer_id) REFERENCES customer(customer_id); 

SELECT TOP 10 * FROM customer c
INNER JOIN customer_store_address ca
ON c.customer_id = ca.customer_id; -- test the relation between customer and customer_store_address table.

CREATE TRIGGER preventDelcustomerStoreAddress ON customer_store_address
INSTEAD OF DELETE
AS
BEGIN
     RAISERROR ('Deletion are not permitted',16,1);
END;

CREATE TRIGGER preventDelorderitem ON order_item
INSTEAD OF DELETE
AS
BEGIN
     RAISERROR ('Deletion are not permitted',16,1);
END; 

DELETE FROM order_item
WHERE order_item_id = 1; -- try delete to test trigger

DELETE FROM customer_store_address
WHERE customer_id = 20755;

UPDATE customer_store_address
SET country = 'United States of America'
WHERE country = 'EE. UU.'; 

UPDATE customer_store_address
SET zipcode = 91732
WHERE customer_id = 14046;

UPDATE customer_store_address
SET zipcode = 95758
WHERE customer_id = 14577

UPDATE customer_store_address
SET zipcode = 95758
WHERE customer_id = 17171; 

UPDATE customer_store_address
SET state = 'CA'
WHERE customer_id IN(14577,17171,14046);

UPDATE customer_store_address
SET city = 'Elk Grove'
WHERE customer_id IN(14577,17171);

UPDATE customer_store_address
SET city = 'El Monte'
WHERE customer_id = 14046;

SELECT TOP 10 * FROM customer_store_address WHERE customer_id IN ( 14046,17171,14577)*/ --check data insertion



