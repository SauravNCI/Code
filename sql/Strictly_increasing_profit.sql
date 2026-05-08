Table: products

product_id | product_name
P1 | Shampoo
P2 | Soap
P3 | Toothpaste
P4 | Facewash

Table: sales
product_id | sale_date | profit
P1 | 2024-01-01 | 100	1
P1 | 2024-01-02 | 120	2
P1 | 2024-01-03 | 150	3
P2 | 2024-01-01 | 200	1
P2 | 2024-01-02 | 180	2
P2 | 2024-01-03 | 220	3
P3 | 2024-01-01 | 50
P3 | 2024-01-02 | 70
P3 | 2024-01-03 | 90
P4 | 2024-01-01 | 300
P4 | 2024-01-02 | 300
P4 | 2024-01-03 | 310

Find all products whose profit strictly increases day over day
with no decline at any point.
Return product_id and product_name.




WITH t1 AS (
    SELECT  
        product_id,
        profit,
        LAG(profit) OVER (
            PARTITION BY product_id 
            ORDER BY sale_date
        ) AS prev_profit
    FROM sales
),
t2 AS (
    SELECT 
        product_id,
        CASE 
            WHEN prev_profit IS NOT NULL 
                 AND prev_profit >= profit 
            THEN 1 
            ELSE 0 
        END AS violation
    FROM t1
)
SELECT 
    p.product_id,
    p.product_name
FROM t2
JOIN products p
ON t2.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(violation) = 0;


(b) Find the product name who have flat profit



SELECT 
    p.product_id,
    p.product_name
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING MAX(s.profit) = MIN(s.profit);





Table 1 :
1,A
2,B
3,C
4,x
5,y
6,z

Table2:
1,t
2,u
3,v
1,t
3,v

How many rows we get after inner join, left join , outer join and Left anti join


8, , 6, 3
