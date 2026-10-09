create database WindowsCTE;

CREATE TABLE test_data (
    new_id INT,
    new_cat VARCHAR(50)
);

-- 2. Insert the rows
INSERT INTO test_data (new_id, new_cat) VALUES
(100, 'Agni'),
(200, 'Agni'),
(500, 'Dharti'),
(700, 'Dharti'),
(200, 'Vayu'),
(300, 'Vayu'),
(500, 'Vayu');

-- without windows function 
 
SELECT new_cat,SUM(new_id) AS total_sum 
FROM test_data
group by new_cat;


-- with windows function using aggregate functions (parition by )

select new_id , new_cat , 
sum(new_id) over(partition by new_cat order by new_id) AS "TOTAL",
avg(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Average",
COUNT(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Count",
MIN(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Min",
MAX(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Max"
FROM test_data;

-- without partition by 
SELECT new_id, new_cat,
SUM(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Total",
AVG(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Average",
COUNT(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Count",
MIN(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Min",
MAX(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Max"
FROM test_data;


/* query explaination - 
SUM(new_id)The calculation to perform on the numbers.
OVER (...)-Marks this calculation as a Window Function. It tells SQL: "Do not collapse the table down to one row; compute this inside a temporary window of rows."
PARTITION BY new_cat-Splits the data into separate categories (Agni, Dharti, Vayu).
The calculations reset completely when moving to a new category.
ORDER BY new_id-Sorts the rows inside each group by new_id before calculating.
parition by and no patition by partition by helps to use the aggreagate on specific rows 
but if want to calculate for all rows we reomve partiton by from the query 
*/

/* difference if we dont use windows functions all rows collapsed like dharti -> 300 but we dont know 
in dharti who has 200 and who has 100 we only get one row of sum which -> 300
if we use windows function we get total row + indivuials to see who has 100 and who has 200  */

 
 
 -- 2 windows function using Ranking functions 
 
select  new_id , 
row_number() over(order by new_id) AS "ROW_NUMBER", 
rank() over(order by new_id) AS "RANK",
dense_rank() over(order by new_id) AS "DENSE_RANK",
percent_rank() over(order by new_id) AS "PERCENT RANK"
from test_data;

/*  diff betn rank vs dense rank 
in rank if 2 numbers repeat like 200 then rank gives them same no (2) and skips the next no which is (3) and starts from (4) 
in dense rank if no repeats like 200 it also ranks with same no (2) to both but does not skips next and starts with next no(3) */

-- 3 windows function with analytics functions 
select new_id, 
first_value(new_id) over(partition by new_cat order	by new_id) As "FIRST VALUE",
last_value(new_id) over(partition by new_cat order	by new_id) AS "LAST VALUE",
lead(new_id) over(partition by new_cat order	by new_id) AS "LEAD VALUE",
lag(new_id) over(partition by new_cat order	by new_id) AS "LAG VALUE"
from test_data;

SELECT 
    new_id, 
    FIRST_VALUE(new_id) OVER(
        PARTITION BY new_cat 
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS "FIRST VALUE",
    LAST_VALUE(new_id) OVER(
        PARTITION BY new_cat 
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS "LAST VALUE",
    LEAD(new_id) OVER(
        PARTITION BY new_cat 
        ORDER BY new_id
    ) AS "LEAD VALUE",
    LAG(new_id) OVER(
        PARTITION BY new_cat 
        ORDER BY new_id
    ) AS "LAG VALUE"
FROM test_data;

/* imp note - always use rows betn unbounded procedding and unbounded following in code this give correct last value 
using partition or other may not give a correct last value */