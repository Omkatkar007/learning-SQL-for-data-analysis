-- MySQL Transactions Practice (Advanced)

USE transaction_practice;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT
);

START TRANSACTION;

INSERT INTO orders VALUES (101,'Laptop',1);

SAVEPOINT after_order_insert;

INSERT INTO orders VALUES (102,'Mouse',2);

ROLLBACK TO after_order_insert;

COMMIT;

-- Disable autocommit for session
SET autocommit = 0;

START TRANSACTION;

UPDATE accounts
SET balance = balance + 500
WHERE id = 1;

COMMIT;

SET autocommit = 1;

SELECT * FROM orders;
SELECT * FROM accounts;
