WITH CTE AS(
SELECT 
* ,ROW_NUMBER() over(partition by acc_id order by status_date desc) as k
FROM fb_account_status  
WHERE status_date<='2020-01-10'
)
, CTE1 AS(
SELECT acc_id,status,
case when status = 'closed' then 1 else 0 end as total_closed
 FROM CTE WHERE k=1
)
SELECT sum(total_closed)*1.0/(select count(*) from cte1) as ratio FROM CTE1