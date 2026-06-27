with cte1 as(
SELECT t1.*,t2.banned as driver_ban_status
from (select t.*, u.banned as client_ban_status 
from trips t join users u
on t.client_id = u.users_id) t1 join users t2
on t1.driver_id = t2.users_id)
, cte2 as(
select *,
row_number() over(partition by request_at order by request_at) as r,
case when status = 'cancelled_by_driver' or status = 'cancelled_by_client' then 1 else 0 end as cancelled_status
from cte1
where (date(request_at) >=date('2013-10-01') and date(request_at)<=date('2013-10-03')) and client_ban_status='No' and driver_ban_status = 'No'
)




select request_at as 'Day',round(sum(cancelled_status)/max(r),2)  as 'Cancellation Rate' from cte2
group by request_at
