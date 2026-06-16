with t1 as
(select *,assignment1+assignment2+assignment3 as total  from box_scores)
select max(total)-min(total) as d
from t1



