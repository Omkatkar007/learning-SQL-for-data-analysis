select * from payment;
select * from customer;


WITH my_cte AS (
    SELECT *, 
        AVG(amount) OVER(ORDER BY customer_id) AS "Average_Price",
        COUNT(address_id) OVER(ORDER BY customer_id) AS "Count"
    FROM payment AS p
    INNER JOIN customer AS c
        USING (customer_id)   -- used (using) because we use mysql which cannot print duplicate columns like customer_id
)
SELECT first_name, last_name, amount
FROM my_cte;

/* we use cte(common table expression) to create a temprorary table 
why instead of subqueries using subqueries or queries creates table and stores in database 
while cte creates an temprorary table which exists in memory 

tips use  ; delometer at the end like first cte query with cluas
then 2nd main query select clause then use delimeter using delimeter to 
1 query wont run the indiviual query */

-- using CTE to create multiple temp tables 

WITH my_cp AS (        
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        p.amount,
        AVG(p.amount) OVER(ORDER BY c.customer_id) AS Average_Price,
        COUNT(c.address_id) OVER(ORDER BY c.customer_id) AS "Count"
    FROM payment AS p
    INNER JOIN customer AS c
        ON p.customer_id = c.customer_id
),
my_ca AS (
    SELECT 
        c.customer_id,
        a.city,
        a.country
    FROM customer AS c 
    INNER JOIN address AS a 
        ON c.address_id = a.address_id
)
SELECT 
    cp.first_name, 
    cp.last_name, 
    ca.city, 
    ca.country, 
    cp.amount
FROM my_cp AS cp
INNER JOIN my_ca AS ca
    ON cp.customer_id = ca.customer_id;
-- dont use * for columns in mysql while using cte errors occured / use in postgresql 

/* by using colon we can create multiple temp tables and above we compared data of 3 diff tables together using cte  */

