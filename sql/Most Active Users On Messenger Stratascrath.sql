

with t1 as(
select user1 as u, sum(msg_count) as total_sent  from fb_messages
group by user1
) 
, t2 as(
select user2 as u, sum(msg_count) as total_received from fb_messages
group by user2
)
, t3 as(
select 
coalesce(t1.u,t2.u) as u, coalesce(t1.total_sent,0) as total_sent, coalesce(t2.total_received,0) as total_received
from t1 full outer join t2
on t1.u  = t2.u
)
select u, total_sent+total_received as total_messages
from t3

order by total_messages desc limit 10;



