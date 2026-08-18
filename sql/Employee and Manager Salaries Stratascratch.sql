select t1.first_name,t1.emp_s as salary
from
(select 
e1.first_name,e1.salary as emp_s, e2.salary as man_s
from employee e1 join employee e2
on e1.manager_id = e2.id) t1
where t1.emp_s>t1.man_s