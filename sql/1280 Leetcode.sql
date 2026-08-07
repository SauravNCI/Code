with cte1 as (select t1.student_id, t1.student_name,t1.subject_name as s1,  e.subject_name as s2
from 
(select student_id,student_name,subject_name
from students s join subjects ) t1 left join examinations e
on t1.student_id = e.student_id and t1.subject_name =e.subject_name
)
, cte2 as(
select student_id, student_name ,s1
, case when s2 is null then 0 else 1 end as attended_exams
from cte1)
select student_id,student_name, s1 as subject_name , sum(attended_exams) as attended_exams
from cte2 group by student_id,student_name,s1 order by student_id, s1
