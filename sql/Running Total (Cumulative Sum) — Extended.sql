CREATE TABLE sales (id INT, customer_id INT, order_date DATE, amount INT);
INSERT INTO sales VALUES
(1,1,'2026-01-01',100),(2,1,'2026-01-05',200),(3,1,'2026-01-10',50),
(4,1,'2026-02-03',400),(5,1,'2026-02-15',150),
(6,2,'2026-01-02',300),(7,2,'2026-01-06',100),(8,2,'2026-02-01',250),
(9,3,'2026-01-20',500),(10,3,'2026-01-20',500),(11,3,'2026-03-01',200);
select * from sales;

select *,
sum(amount) over(partition by customer_id order by order_date rows between  unbounded preceding and current row ) as voila
from sales
/*
Q7a. For each order, show the running total of amount per customer, ordered by date.
Expected: customer 1 → 100, 300, 350, 750, 900 | customer 2 → 300, 400, 650 | customer 3 → 1000 (or 500, 1000), 1200
select *,
sum(amount) over(partition by customer_id order by order_date rows between  unbounded preceding and current row ) as voila
from sales
Q7b. Same as above, but the running total should reset at the start of every month for each customer.
Expected: customer 1 → Jan: 100, 300, 350; Feb: 400, 550
select *,
sum(amount) over(partition by customer_id, month(order_date) order by order_date rows between  unbounded preceding and current row ) as voila
from sales
Q7c. For each order, show the running total AND what % of that customer's overall total has been reached so far.
Expected (customer 2): 300 → 46.15%, 400 → 61.54%, 650 → 100%

Q7d. For each order, show the average of the current order and the 2 orders before it (per customer, by date). For the first two orders, average whatever is available.
Expected (customer 1): 100, 150, 116.67, 216.67, 200
select *,
avg(amount) over(partition by customer_id order by order_date rows between  2 preceding and current row ) as voila
from sales
Q7e. Find the date on which each customer's running total first crossed 500.
Expected: customer 1 → 2026-02-03, customer 2 → 2026-02-01, customer 3 → 2026-01-20
with t1 as(select *,
sum(amount) over(partition by customer_id order by order_date rows between  unbounded preceding and current row ) as voila
from sales)
,t2 as(select customer_id , order_date, row_number() over(partition by customer_id order by order_date) as r from t1
where  voila>=500)
select customer_id,order_date
from t2
where r =1
Q7f. Customer 3 has two orders on the same date (ids 9, 10). Does your Q7a query show 500, 1000 or 1000, 1000 for those rows? 
Make it deterministic: same-date orders should accumulate in order of id.


*/