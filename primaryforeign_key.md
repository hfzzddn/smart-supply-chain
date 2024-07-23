**List of Primary and Foreign Key**

-- Primary Keys

```sql
ALTER TABLE category
ADD CONSTRAINT pk_category PRIMARY KEY (category_id);

ALTER TABLE customer
ADD CONSTRAINT pk_customer PRIMARY KEY (customer_id);

ALTER TABLE customer_store_address
ADD CONSTRAINT pk_customer_store_address PRIMARY KEY (customer_id, street, city, state, zipcode, country);

ALTER TABLE order_details
ADD CONSTRAINT pk_order_details PRIMARY KEY (order_item_id);

ALTER TABLE order_item
ADD CONSTRAINT pk_order_item PRIMARY KEY (order_item_id);

ALTER TABLE product
ADD CONSTRAINT pk_product PRIMARY KEY (product_code);

```

-- Foreign Keys

```sql
ALTER TABLE customer_store_address
ADD CONSTRAINT fk_customer_store_address_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE order_details
ADD CONSTRAINT fk_order_details_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE order_details
ADD CONSTRAINT fk_order_details_order_item FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id);

ALTER TABLE order_item
ADD CONSTRAINT fk_order_item_product FOREIGN KEY (product_code) REFERENCES product(product_code);

ALTER TABLE order_item
ADD CONSTRAINT fk_order_item_category FOREIGN KEY (category_id) REFERENCES category(category_id);

ALTER TABLE product
ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category(category_id);

```
