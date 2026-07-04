with t1 as(select *, lead(record_date,1) over(partition by user_id order by record_date) as d2,
lead(record_date,2) over(partition by user_id order by record_date) as d3
from sf_events)
select user_id from t1
where d2 = dateadd(day,1,record_date) and d3= dateadd(day,2,record_date);
-- SOlUTION: This SQL query is designed to find users who have recorded events on three consecutive days.


with cte1 as(select
*,
row_number() over(partition by user_id order by record_date) as r1
from sf_events)
, t2 as(
select *,Date_SUB(record_date, interval r1 day) as streak_grp
from cte1
)
select user_id from t2
group by streak_grp
having count(*) >=3
-- SOLUTION: This SQL query is designed to find users who have recorded events on three consecutive days. It uses a common table expression (CTE) to assign a row number to each event for each user, then calculates a "streak group" by subtracting the row number from the record date. Finally, it groups by this streak group and filters for users with at least three events in the same streak group, indicating three consecutive days of activity.