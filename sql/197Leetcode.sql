with t1 as
(select id ,temperature, recorddate,lag(recorddate,1) over(order by recorddate) as previousdate,lag(temperature,1) over(order by recorddate) as t
from weather
)
select id from t1 where temperature>t and datediff(recorddate,previousdate)=1
