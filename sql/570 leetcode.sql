with t1 as(
select managerId from employee group by managerid
having count(*)>4)
select name from employee join t1 where
id = t1.managerid
