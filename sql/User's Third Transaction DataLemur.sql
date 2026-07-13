with t1 as(
select *,row_number() over(partition by user_id order by transaction_date) as r 
from TRANSACTIONS
)
select user_id,spend,transaction_date from t1
where r=3 
group by user_id;