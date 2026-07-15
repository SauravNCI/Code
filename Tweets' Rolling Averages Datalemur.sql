with t1 AS(SELECT *, 
avg(tweet_count) over(partition by user_id order by tweet_date rows BETWEEN  2 PRECEDING and current ROW )
as 	rolling_avg_3d
from tweets)
select user_id,tweet_date,round(rolling_avg_3d,2) from t1