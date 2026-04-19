1164. Product Price at a Given Date
Solved
Medium
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
Initially, all products have price 10.

Write a solution to find the prices of all products on the date 2019-08-16.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+
 

with t as(
select 
*, row_number() over(partition by product_id order by change_date desc) as r from products where change_date<='2019-08-16' )
,t1 as(
    select * from t where r =1
)
, t2 as(

    select p.product_id,t1.new_price

    from products p left join t1
    on p.product_id = t1.product_id group by p.product_id
)
select product_id, case 
when new_price is null then 10 else new_price end as price from t2

