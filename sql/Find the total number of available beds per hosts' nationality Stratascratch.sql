with t1 as(
select aa.*
, nationality
from airbnb_apartments aa join airbnb_hosts ah
on aa.host_id = ah.host_id
)

select
nationality,
sum(n_beds)
from t1 group by nationality
