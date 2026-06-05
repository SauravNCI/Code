%sql
with cte1 as(
select *, row_number() over(partition by user_id order by activity_date) as r1 from 
(select  *,sum(value) over(partition by user_id order by activity_date rows between unbounded preceding and current row ) as s from queries.default.table1) t1
where s>=30 )
select * from cte1 where r1 =1