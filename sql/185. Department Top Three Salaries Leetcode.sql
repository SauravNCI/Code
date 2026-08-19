
select d.name as Department,t1.name as Employee,t1.salary as Salary from
(select e.*, dense_rank() over(partition by e.departmentId order by e.salary desc) as r
from Employee e) t1 join  department d
on t1.departmentId= d.id
where t1.r<4