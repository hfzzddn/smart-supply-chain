# smart-supply-chain

**Author:** Mohamad Hafizzudin Bin Yahya

**Project Name:** Smart Supply Chain Database Project

**Email:** hafizz.yahya01@gmail.com

**LinkedIn:** http://www.linkedin.com/in/mohamad-hafizzuddin

**Overview**

The Smart Supply Chain Database Project integrates SQL Server Management Studio (SSMS) to build a system for managing supply chain dataset. The project focuses on data cleaning, data normalization, data transfromation and ETL processes.

**Tools Used:**

**SQL Server Management Studio:** For database creation, data cleaning,data management,data normalization and data manipulation.

# **ETL Process**

**1. Extract**
Data was extracted from the raw dataset sourced from [Kaggle - DataCo Smart Supply Chain](https://www.kaggle.com/datasets/alinoranianesfahani/dataco-smart-supply-chain-for-big-data-analysis).

**2. Transform**
Using SQL Server Management STudio, the data is normalize it into a structured format. This process involved:

- Splitting data into relevant tables.
- Ensuring data integrity and consistency.
  
**3. Load**
The transformed data was loaded into SQL Server, where it was normalized into six distinct tables:


### `category`
| Column Name   | Data Type    | Description                              |
|---------------|--------------|------------------------------------------|
| category_id   | int          | Primary key, unique identifier for each category |
| category_name | nvarchar(50) | Name of the category                     |

### `customer`
| Column Name   | Data Type    | Description                              |
|---------------|--------------|------------------------------------------|
| customer_id   | int          | Primary key, unique identifier for each customer |
| customer_name | nvarchar(50) | Full name of the customer                |
| email         | nvarchar(50) | Email address of the customer            |
| c_password    | nvarchar(50) | Encrypted password for customer login    |
| segment       | nvarchar(50) | Customer segment                         |

### `customer_store_address`
| Column Name     | Data Type     | Description                              |
|-----------------|---------------|------------------------------------------|
| customer_id     | int           | Foreign key, references customer(customer_id) |
| street          | nvarchar(50)  | Street address                           |
| city            | nvarchar(50)  | City                                     |
| state           | nvarchar(50)  | State                                    |
| zipcode         | int           | Zip code                                 |
| country         | nvarchar(50)  | Country                                  |
| department_id   | tinyint       | Department identifier                    |
| department_name | nvarchar(50)  | Department name                          |
| latitude        | decimal(18,15)| Latitude coordinates                     |
| longitude       | decimal(18,15)| Longitude coordinates                    |

### `order_details`
| Column Name            | Data Type     | Description                              |
|------------------------|---------------|------------------------------------------|
| order_item_id          | int           | Foreign key, references order_item(order_item_id) |
| customer_id            | int           | Foreign key, references customer(customer_id) |
| city                   | nvarchar(50)  | Order city                               |
| state                  | nvarchar(50)  | Order state                              |
| country                | nvarchar(50)  | Order country                            |
| region                 | nvarchar(50)  | Order region                             |
| market                 | nvarchar(50)  | Market segment                           |
| type_of_transaction    | nvarchar(50)  | Type of transaction                      |
| order_date             | datetime2(7)  | Date of order                            |
| order_status           | nvarchar(50)  | Status of order                          |
| delivery_date          | datetime2(7)  | Date of delivery                         |
| delivery_status        | nvarchar(50)  | Status of delivery                       |
| late_delivery_risk     | tinyint       | Risk of late delivery                    |
| schedule_shipment_day  | tinyint       | Scheduled shipment days                  |
| actual_shipment_day    | tinyint       | Actual shipment days                     |
| shipping_mode          | nvarchar(50)  | Mode of shipping                         |

### `order_item`
| Column Name        | Data Type     | Description                              |
|--------------------|---------------|------------------------------------------|
| order_item_id      | int           | Primary key, unique identifier for each order item |
| order_id           | int           | Order identifier                         |
| product_code       | int           | Foreign key, references product(product_code) |
| category_id        | int           | Foreign key, references category(category_id) |
| product_price      | numeric(7,2)  | Price of the product                     |
| order_quantity     | tinyint       | Quantity ordered                         |
| discount           | numeric(7,2)  | Discount applied                         |
| discount_rate      | numeric(7,2)  | Discount rate                            |
| profit_ratio       | numeric(7,2)  | Profit ratio                             |
| profit_per_order   | numeric(7,2)  | Profit per order                         |
| sales_per_customer | numeric(7,2)  | Sales per customer                       |
| sales              | numeric(7,2)  | Total sales                              |

### `product`
| Column Name    | Data Type     | Description                              |
|----------------|---------------|------------------------------------------|
| product_code   | int           | Primary key, unique identifier for each product |
| product_name   | nvarchar(50)  | Name of the product                      |
| product_price  | numeric(7,2)  | Price of the product                     |
| product_status | tinyint       | Status of the product                    |
| category_id    | int           | Foreign key, references category(category_id) |
| product_image  | nvarchar(100) | URL of the product image                 |



**Entity Relationship Diagram**

![ERD](https://github.com/user-attachments/assets/178da265-9249-453d-9b31-606bce2ec2bb)


