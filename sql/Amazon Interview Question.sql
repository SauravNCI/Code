CREATE TABLE subscribers (
  customer_id INT,
  subscription_date DATE,
  plan_value INT
);

INSERT INTO subscribers VALUES
(1, '2023-03-02', 799),
(1, '2023-04-01', 599),
(1, '2023-05-01', 499),
(2, '2023-04-02', 799),
(2, '2023-07-01', 599),
(2, '2023-09-01', 499),
(3, '2023-01-01', 499),
(3, '2023-04-01', 599),
(3, '2023-07-02', 799),
(4, '2023-04-01', 499),
(4, '2023-09-01', 599),
(4, '2023-10-02', 499),
(4, '2023-11-02', 799),
(5, '2023-10-02', 799),
(5, '2023-11-02', 799),
(6, '2023-03-01', 499);



/* Number of Unique customer_id*/
with cte as(
select customer_id,subscription_date,plan_value,
lead(plan_value,1,plan_value) over(partition by customer_id order by subscription_date) as ever_upgraded,
  lag(plan_value,1,plan_value) over(partition by customer_id order by subscription_date) as ever_downgraded

from subscribers
),
cte2 as(
select * , 
case when plan_value<ever_upgraded then 1 else 0 end as u ,
  case when plan_value>ever_downgraded then 1 else 0 end as d 
from cte
)

select customer_id,
case when sum(u)>1 then 'yes' else 'no' end as upgraded,
case when sum(d)>1 then 'yes' else 'no' end as downgraded
  from cte2
  group by customer_id

