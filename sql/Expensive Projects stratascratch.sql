with t1 as(
select 
m.* , t.emp_counts
from ms_projects as m 
join
(select project_id,count(*) as emp_counts from ms_emp_projects group by project_id) as t
on m.id  = t.project_id
)
, t2 as(
select
t1.*, mep.emp_id, t1.budget/emp_counts as budget_per_emp
from
ms_emp_projects mep join t1
on mep.project_id = t1.id
)

select emp_id,sum(budget_per_emp) as total_exp from t2
group by emp_id 

