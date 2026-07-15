with t1 AS(SELECT employee.*,department.department_name 
, dense_rank() over(partition by department.department_id order by employee.salary desc) as r
FROM employee join department 
on employee.department_id = department.department_id)
select department_name,name,salary from t1
where r<4 order by department_name,salary desc,name