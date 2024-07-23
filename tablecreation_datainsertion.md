**Query for table creation**

```sql
USE supply_chain;
GO

CREATE TABLE category (
    category_id int NOT NULL,
    category_name nvarchar(50) NOT NULL
);

CREATE TABLE customer (
    customer_id int NOT NULL,
    customer_name nvarchar(50) NOT NULL,
    email nvarchar(50) NOT NULL,
    c_password nvarchar(50) NOT NULL,
    segment nvarchar(50) NOT NULL
);

CREATE TABLE customer_store_address (
    customer_id int NOT NULL,
    street nvarchar(50) NOT NULL,
    city nvarchar(50) NOT NULL,
    state nvarchar(50) NOT NULL,
    zipcode int NULL,
    country nvarchar(50) NOT NULL,
    department_id tinyint NOT NULL,
    department_name nvarchar(50) NOT NULL,
    latitude decimal(18,15) NOT NULL,
    longitude decimal(18,15) NOT NULL
);

CREATE TABLE order_details (
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
    shipping_mode nvarchar(50) NOT NULL
);

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
    sales numeric(7,2) NOT NULL
);

CREATE TABLE product (
    product_code int NOT NULL,
    product_name nvarchar(50) NOT NULL,
    product_price numeric(7,2) NOT NULL,
    product_status tinyint NOT NULL,
    category_id int NOT NULL,
    product_image nvarchar(100) NOT NULL
);

```

**QUery for data insertion**

```sql

INSERT INTO category (category_id, category_name)
SELECT DISTINCT Category_Id, Category_Name
FROM dataCoSupplyC;

INSERT INTO customer (customer_id, customer_name, email, c_password, segment)
SELECT DISTINCT Customer_Id, CONCAT(Customer_Fname, ' ', Customer_Lname), Customer_Email, Customer_Password, Customer_Segment
FROM dataCoSupplyC;

INSERT INTO customer_store_address (customer_id, street, city, state, zipcode, country, department_id, department_name, latitude, longitude)
SELECT Customer_Id, Customer_Street, Customer_City, Customer_State, Customer_Zipcode, Customer_Country, Department_Id, Department_Name, Latitude, Longitude
FROM dataCoSupplyC;

INSERT INTO order_details (order_item_id, customer_id, city, state, country, region, market, type_of_transaction, order_date, order_status, delivery_date, delivery_status, late_delivery_risk, schedule_shipment_day, actual_shipment_day, shipping_mode)
SELECT Order_Item_Id, Customer_Id, Order_City, Order_State, Order_Country, Order_Region, Market, Type, order_date_DateOrders, Order_Status, shipping_date_DateOrders, Delivery_Status, Late_delivery_risk, Days_for_shipment_scheduled, Days_for_shipping_real, Shipping_Mode
FROM dataCoSupplyC;

INSERT INTO order_item (order_item_id, order_id, product_code, category_id, product_price, order_quantity, discount, discount_rate, profit_ratio, profit_per_order, sales_per_customer, sales)
SELECT Order_Item_Id, Order_Id, Product_Card_Id, Product_Category_Id, Product_Price, Order_Item_Quantity, Order_Item_Discount, Order_Item_Discount_Rate, Order_Item_Profit_Ratio, Order_Profit_Per_Order, Sales_per_customer, Sales
FROM dataCoSupplyC;

INSERT INTO product (product_code, product_name, product_price, product_status, category_id, product_image)
SELECT Product_Card_Id, Product_Name, Product_Price, Product_Status, Product_Category_Id, Product_Image
FROM dataCoSupplyC;

```
