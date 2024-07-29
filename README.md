# smart-supply-chain

**Author:** Mohamad Hafizzudin Bin Yahya

**Project Name:** Smart Supply Chain Database Project

**Email:** hafizz.yahya01@gmail.com

**LinkedIn:** http://www.linkedin.com/in/mohamad-hafizzuddin

**Tableau Public:** https://public.tableau.com/app/profile/hafiz.yahya/vizzes

Overview
The Smart Supply Chain Database Project leverages SQL Server Management Studio (SSMS) and Tableau to create a robust system for managing and visualizing supply chain data. This project demonstrates how to integrate database management with advanced data visualization to provide actionable insights into supply chain operations.

Tools Used:

**SQL Server Management Studio:** For database creation,data cleaning, management, and data manipulation.

**Power Query:** For data transformation and loading into Excel.

**Excel:** For linking tables and further data manipulation.

**Tableau:** For advanced data visualization.

**Database Schema**

The database schema consists of the following tables:


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


**Dataset:** https://www.kaggle.com/datasets/alinoranianesfahani/dataco-smart-supply-chain-for-big-data-analysis

**Entity Relationship Diagram**

![ERD](https://github.com/user-attachments/assets/178da265-9249-453d-9b31-606bce2ec2bb)



# **Suspected Fraud Analysis Dashboard**

**Overview**

The Tableau Public dashboard provides insights into suspected fraud within the supply chain data. It includes various visualizations that help in understanding the trends and patterns of fraud over time.

**Dashboard Components**

**Percentage of Suspected Fraud by Shipping Mode**
Description: This bar chart displays the distribution of fraud incidents by shipping class.
Insight: The majority of fraud incidents are associated with the Standard Class (59.28%).


**Suspected Fraud Trend by Year**
Description: This line chart shows the trend of fraud incidents over the years from 2014 to 2018.
Insight: There are noticeable fluctuations and peaks in fraud incidents over the years.

**Top Product Fraud and Loss Analysis**
Description: This bar chart lists the top product codes associated with the most fraud incidents.
Insight: Product code 1004 has the highest number of fraud incidents.

**Percentage of Suspected Fraud By Customer Segment**
Description: This pie chart shows the distribution of fraud incidents by customer segment.
Insight: The Consumer segment has the highest number of fraud incidents.



# **Tableau Dashboard Visuals**

**Percentage of Suspected Fraud by Shipping Mode**
**Visualization Type:** Bar Chart

**Fields Used:**
Dimensions: Shipping Class
Measures: Count of Fraud Incidents
Insights:
Standard Class: 59.28%
Second Class: 18.44%
First Class: 16.89%
Same Day: 5.39%

![Percentage of suspected fraud by shipping mode](https://github.com/user-attachments/assets/7618f4e1-dbb3-4a06-8b7e-5e95d732e6aa)



**Suspected Fraud Trend by Year**
**Visualization Type: Line Chart**

Fields Used:
Dimensions: Year
Measures: Count of Fraud Incidents
Insights:
Significant peaks in fraud incidents observed in certain periods.
Overall trend shows fluctuations from 2014 to 2018.

![Suspected Fraud Trend by Year](https://github.com/user-attachments/assets/9fcb7f99-5b95-4e3b-a1ef-b87a18077ac4)




**Top Product Fraud and Loss Analysis**
**Visualization Type: Bar Chart**

Fields Used:
Dimensions: Product Code
Measures: Count of Fraud Incidents
Insights:
Product code 1004 has the highest number of fraud incidents.
Other top products include codes 957, 403, 1073, and 365.

![Top Product Fraud and Loss Analysis](https://github.com/user-attachments/assets/0326993f-574b-462c-849b-ba89dd8dc648)




**Percentage of Suspected Fraud By Customer Segment**
**Visualization Type: Pie Chart**

Fields Used:
Dimensions: Customer Segment
Measures: Count of Fraud Incidents
Insights:
Consumer segment has the highest number of fraud incidents.
Other segments include Corporate and Home Office.

![Percentage of Suspected Fraud by Customer Segment](https://github.com/user-attachments/assets/1bc2c722-732b-455c-a1ac-db4438ee136f)



**Connecting SSMS and Tableau Public via Excel**

**Exporting Data from SSMS:**
Data from the SSMS database is exported to Excel using the Export Data feature in SSMS.

**Using Excel as an Intermediary:**
Excel is used as an intermediary connection to link SSMS data to Tableau Public.

**Connecting Excel to Tableau Public:**
The Excel file with the exported data is then imported into Tableau Public as a data source.

**Creating Visualizations:**
Various visualizations are created in Tableau Public using the imported data.
Building the Dashboard:
The visualizations are arranged into a cohesive dashboard that provides insights into suspected fraud patterns.

**Conclusion**

This project demonstrates the integration of SSMS, Excel, and Tableau Public to analyze and visualize supply chain data. The resulting dashboard provides valuable insights into patterns of suspected fraud, helping to identify and address potential issues within the supply chain.

# **Suspected Fraud Analysis Dashboard**

![Suspected Analysis Dashboard](https://github.com/user-attachments/assets/ebf44127-e359-4698-a47a-1e21d1c89f57)

