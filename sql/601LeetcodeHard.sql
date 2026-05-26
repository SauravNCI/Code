
with t1 as
(select id, visit_date, people, lead(id,1) over(order by visit_date) n1, lead(id,2) over(order by visit_date) n2
from (select * from stadium where people>=100) t)
,
t2 as (
select id from t1
where n1 = id+1 and n2 = id+2
union 
select n1 from t1
where n1 = id+1 and n2 = id+2
union 
select n2 from t1
where n1 = id+1 and n2 = id+2
)
 select * from stadium
where id in (select id from t2)