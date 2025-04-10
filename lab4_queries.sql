-- Use your schema
USE schemaa;

-- 1. Create tables with at least TWO integrity constraints each
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE CHECK (email LIKE '%@%.%')  -- CHECK + UNIQUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) CHECK (price >= 0)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_products (
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 2. Create an index on a commonly used column
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- 3. Create a VIEW to hide sensitive or unnecessary columns
CREATE VIEW customer_orders_summary AS
SELECT 
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id;

-- 4. Create and test a TRANSACTION
BEGIN;

-- Insert customer
INSERT INTO customers (customer_id, name, email)
VALUES (101, 'Alice Smith', 'alice@example.com');

-- Insert product
INSERT INTO products (product_id, product_name, price)
VALUES (301, 'Wireless Mouse', 25.99);

-- Insert order
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (201, 101, CURRENT_DATE, 150.00);

-- Insert order-product relation
INSERT INTO order_products (order_id, product_id, quantity)
VALUES (201, 301, 3);

INSERT INTO customers (customer_id, name, email)
VALUES (102, 'Bob Jones', 'bob@example.com');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (202, 102, CURRENT_TIMESTAMP, 50.00);

-- Update order total
UPDATE orders
SET total_amount = 77.97
WHERE order_id = 201;


-- 5. Complex query: JOINs + Subquery + HAVING
SELECT 
    c.name AS customer_name,
    o.order_id,
    o.total_amount,
    p.product_name,
    op.quantity
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_products op ON o.order_id = op.order_id
JOIN 
    products p ON op.product_id = p.product_id
WHERE 
    o.total_amount >= (
        SELECT AVG(total_amount) 
        FROM orders
    )
GROUP BY 
    c.name, o.order_id, o.total_amount, p.product_name, op.quantity
HAVING 
    SUM(op.quantity) > 2;

-- Show the result after transaction for verification
SELECT * FROM customers WHERE customer_id = 101;
SELECT * FROM orders WHERE order_id = 201;
SELECT * FROM order_products WHERE order_id = 201;
