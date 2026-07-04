
with t1 as(
select 
e1.name as em,e1.salary as s1,e2.name as mn,e2.salary as s2
from employee e1 join employee e2
where e1.managerid = e2.id)

select em as 'Employee'from
t1
where s1>s2