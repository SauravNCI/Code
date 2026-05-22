
with t1 as
(select user_id,session_id, timestampdiff(minute,min(event_timestamp),max(event_timestamp)) as duration,
sum(case when event_type = 'click' then 1 else 0 end) as total_clicks,
sum(case when event_type = 'scroll' then 1 else 0 end) as total_scroll
from app_events
group by user_id,session_id
having total_scroll>=5 and duration > 30)
, t2 as(

    select 
    a.user_id,a.session_id,a.event_type,total_scroll,(1.0*total_clicks)/total_scroll as click_to_scroll,t1.duration
    from app_events a join t1
    on a.user_id = t1.user_id and a.session_id = t1.session_id
)

select session_id,user_id,duration as session_duration_minutes,total_scroll as scroll_count from t2 where t2.session_id not in ( select session_id from app_events
    where event_type = 'purchase') and click_to_scroll<0.20 
    group by  session_id,user_id,duration,total_scroll
    order by total_scroll desc, session_id

