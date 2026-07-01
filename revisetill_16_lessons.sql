-- task 1  CRUD +  data entry 
create database logistics_hub;
use logistics_hub;
create table warehouse_stock( 
 item_id int primary key auto_increment,
 product_name varchar(50) not null,
 sku_code varchar(50) unique,
 quantity int default(0));
 
insert into warehouse_stock(item_id,product_name,sku_code,quantity)
values
(001,'Laptops', 'TECH-LAP-01', 5),
(002,'Office Chairs', 'FURN-CHR-02', 25),
(003,'Packing Tape', 'SUPP-TPE-03', DEFAULT), -- Uses default constraint (0)
(004,'Monitors', 'TECH-MON-04', 12),
(005,'USB Cables', 'TECH-USB-05', 0);

select * from warehouse_stock;
delete from warehouse_stock;
-- task 2 safe modification use transactions 


start transaction; 
update warehouse_stock
set qunatity = 6, sku_code = 4000                     -- to avoid duplicate data entry like neha neha we use id which is uniqe and primary 
where item_id = 1 or product_name = 'laptops';

savepoint bulk_Delete_prep;

delete from warehouse_stock  -- wipes critical rows from data so using transactions 
where qunatity = 0;

delete  from warehouse_stock               -- delete values not rows cloumns = delete from warehouse_stock; 
where quantity is null;                     -- delete whole table = drop table warehouse_stock;

rollback to savepoint bulk_Delete_prep;
commit; 

-- task 2 ii sorting 

select quantity, product_name from warehouse_stock
where quantity between 1 and 15 or (sku_code IN ('TECH-LAP-01', 'TECH-MON-04'));

select quantity from warehouse_stock 
order by quantity desc limit 5; 

-- task 3 aggregation and metrics 
-- 1.The total count of unique items tracked.
-- 2.The total sum of all physical stock currently sitting in the warehouse.
-- 3.A clean string manipulation output that displays the product_name completely uppercase alongside a text flag (e.g., using CONCAT) labeling it for data auditing.
select 
count(item_id) as total_unique_items,
sum(quantity) as total_physical_stock,
concat(upper(product_name), ' - audited') as audited_product
from warehouse_stock group by product_name;  



SET SQL_SAFE_UPDATES = 1; 


-- gemini soltuion with tasks 

-- ========================================================================
--                      SQL REVISION LAB GUIDE
--              TOPICS COVERED: LESSONS 1 TO 16
-- ========================================================================

-- ------------------------------------------------------------------------
-- -- TASK 1: THE BLUEPRINT & DATA ENTRY (Lessons 1-6)
-- ------------------------------------------------------------------------
-- -- Goal: Create the database architecture, enforce integrity constraints, 
-- -- and handle safe batch data insertions.

-- -- 1. Step A: Initialize the schema environment
-- CREATE DATABASE IF NOT EXISTS logistics_hub;
-- USE logistics_hub;

-- -- 2. Step B: Build the table structure with strict constraints
-- -- Features: Auto-incrementing primary key, mandatory fields, 
-- -- completely unique SKU codes, and default check rules for safety.
-- CREATE TABLE IF NOT EXISTS warehouse_stock (
--     item_id INT AUTO_INCREMENT PRIMARY KEY,
--     product_name VARCHAR(100) NOT NULL,
--     sku_code VARCHAR(50) UNIQUE NOT NULL,
--     quantity INT DEFAULT 0 CHECK (quantity >= 0)
-- );

-- -- 3. Step C: Populate the table with targeted sample records
-- -- Note: Row 3 leaves out quantity explicitly to trigger the DEFAULT 0 flag.
-- INSERT INTO warehouse_stock (product_name, sku_code, quantity) 
-- VALUES 
-- ('Laptops', 'TECH-LAP-01', 5),
-- ('Office Chairs', 'FURN-CHR-02', 25),
-- ('Packing Tape', 'SUPP-TPE-03', DEFAULT), 
-- ('Monitors', 'TECH-MON-04', 12),
-- ('USB Cables', 'TECH-USB-05', 0);


-- ------------------------------------------------------------------------
-- -- TASK 2 (PART 1): SAFE DATA MANIPULATION & RECOVERY (Lessons 10-13)
-- ------------------------------------------------------------------------
-- -- Goal: Isolate changes inside a sandbox transaction, create diagnostic 
-- -- checkpoints, test a destructive delete, and roll back time to save data.

-- -- Disable Safe Updates to allow simulation testing
-- SET SQL_SAFE_UPDATES = 0;

-- -- A. Open the private transaction safety net
-- START TRANSACTION;

-- -- B. Execute a standard data update
-- UPDATE warehouse_stock 
-- SET quantity = quantity + 10 
-- WHERE product_name = 'Laptops';

-- -- C. Drop a recovery anchor (Savepoint) right before dangerous ops
-- SAVEPOINT bulk_delete_prep;

-- -- D. CRITICAL ERROR SIMULATION: Accidental destructive delete statement
-- -- This row-clearing action is trapped safely inside our open transaction.
-- DELETE FROM warehouse_stock 
-- WHERE quantity = 0;

-- -- E. TIME TRAVEL: Instantly undo the mistake using our savepoint anchor
-- -- This brings back 'Packing Tape' and 'USB Cables' from the dead!
-- ROLLBACK TO SAVEPOINT bulk_delete_prep;

-- -- F. Lock in the laptop stock update permanently to the live database
-- COMMIT;


-- ------------------------------------------------------------------------
-- -- TASK 2 (PART 2): ADVANCED EXTRACTION & FILTERING (Lessons 7-9, 16)
-- ------------------------------------------------------------------------
-- -- Goal: Construct precise multi-layered WHERE clauses combining logical 
-- -- operators, range values, sorting flags, and limiting clauses.

-- -- Pulling a low-stock alert report:
-- -- Looks for items between 1-15 items left OR flagship priority SKU codes.
-- -- Ordered lowest-to-highest and capped at the top 3 most critical.
-- SELECT product_name, quantity 
-- FROM warehouse_stock
-- WHERE (quantity BETWEEN 1 AND 15) OR (sku_code IN ('TECH-LAP-01', 'TECH-MON-04'))
-- ORDER BY quantity ASC
-- LIMIT 3;


-- ------------------------------------------------------------------------
-- -- TASK 2 (PART 3): AGGREGATIONS, SCALAR & GROUP LOGIC (Lessons 14-15)
-- ------------------------------------------------------------------------
-- -- Goal: Calculate operational summaries and transform strings per row.

-- SELECT 
--     COUNT(item_id) AS total_unique_items,
--     SUM(quantity) AS total_physical_stock,
--     CONCAT(UPPER(product_name), ' - AUDITED') AS audited_product_name
-- FROM warehouse_stock
-- GROUP BY product_name;

-- -- Re-enable Safe Updates to restore default Workbench protection rules
-- SET SQL_SAFE_UPDATES = 1;

-- solution  

-- ========================================================
-- TASK 1: CRUD + DATA ENTRY (Fixed)
-- ========================================================
CREATE DATABASE IF NOT EXISTS logistics_hub;
USE logistics_hub;

-- Create table with constraints
CREATE TABLE IF NOT EXISTS warehouse_stock ( 
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    sku_code VARCHAR(50) UNIQUE,
    quantity INT DEFAULT 0
);
 
-- Inserting data safely
INSERT INTO warehouse_stock (item_id, product_name, sku_code, quantity)
VALUES
(1, 'Laptops', 'TECH-LAP-01', 5),
(2, 'Office Chairs', 'FURN-CHR-02', 25),
(3, 'Packing Tape', 'SUPP-TPE-03', DEFAULT), -- Triggers default (0)
(4, 'Monitors', 'TECH-MON-04', 12),
(5, 'USB Cables', 'TECH-USB-05', 0);

-- Turn off safe updates for testing our deletions
SET SQL_SAFE_UPDATES = 0; 


-- ========================================================
-- TASK 2 (Part 1): Safe Modification & Transactions
-- ========================================================
START TRANSACTION; 

-- Fixed: Target the table name, fixed typo 'quantity', and kept logic focused
UPDATE warehouse_stock
SET quantity = quantity + 10      
WHERE item_id = 1 OR product_name = 'Laptops';

-- Set Savepoint
SAVEPOINT bulk_Delete_prep;

-- This deletes rows where quantity is 0 (Packing Tape & USB Cables)
DELETE FROM warehouse_stock  
WHERE quantity = 0;

-- This deletes rows with missing values (none in our test data, but good syntax!)
DELETE FROM warehouse_stock  
WHERE quantity IS NULL; 

-- Time travel! Restores Packing Tape & USB Cables, but keeps the Laptop update
ROLLBACK TO SAVEPOINT bulk_Delete_prep;

-- Lock it in permanently
COMMIT; 


-- ========================================================
-- TASK 2 (Part 2): Filtering & Sorting
-- ========================================================

-- Pulls low stock OR high priority items
SELECT product_name, quantity 
FROM warehouse_stock
WHERE (quantity BETWEEN 1 AND 15) OR (sku_code IN ('TECH-LAP-01', 'TECH-MON-04'))
ORDER BY quantity ASC -- Task requested lowest stock at the top
LIMIT 3;              -- Top 3 critical items


-- ========================================================
-- TASK 2 (Part 3): Aggregations & Metrics (Added)
-- ========================================================
SELECT 
    COUNT(item_id) AS total_unique_items,
    SUM(quantity) AS total_physical_stock,
    CONCAT(UPPER(product_name), ' - AUDITED') AS audited_product
FROM warehouse_stock
GROUP BY product_name;

-- Turn safe updates back on
SET SQL_SAFE_UPDATES = 1;
