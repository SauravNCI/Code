1393. Capital Gain/Loss
Solved
Medium
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Stocks

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+
(stock_name, operation_day) is the primary key (combination of columns with unique values) for this table.
The operation column is an ENUM (category) of type ('Sell', 'Buy')
Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.
It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day. It is also guaranteed that each 'Buy' operation for a stock has a corresponding 'Sell' operation in an upcoming day.
 

 with t1 as(select *, row_number() over(partition by stock_name order by operation_day) as r from stocks)
select
stock_name, sum(case when operation = 'Buy' then (-1*price) else price end)  as capital_gain_loss from t1 group by stock_name 

