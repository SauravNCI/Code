with t1 as(select player_id , min(event_date) as d
from activity group by player_id)
, t2 as(
    select a.player_id from activity  a join t1
    on a.player_id = t1.player_id where a.event_date= date_add(d,interval 1 day)
)
select round(count(distinct(player_id))*1.0/(select count(distinct(player_id)) from activity ),2) as fraction from t2