with t1 AS
(SELECT e.email_id,t.signup_action
FROM 
emails e left join texts t 
on e.email_id = t.email_id
)
, t2  AS(
SELECT 
sum(case when signup_action = 'Confirmed' then 1 else 0 end) as total_c,
count(DISTINCT(email_id)) as total_u
from t1)

select round(total_c*1.0/total_u,2) from t2 

