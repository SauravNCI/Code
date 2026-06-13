with cte as 
(select 

sum(case when clicked = 1 and search_results_position<4 then 1 else 0 end) as total_clicked,
sum(case when clicked = 0 aND search_results_position<4 then 1 else 0 end) as total_unclicked
, count(*) as total
from fb_search_events 

)

select ( sum(total_clicked)/total)*100 as percentage1, sum(total_unclicked)*100/total
from cte