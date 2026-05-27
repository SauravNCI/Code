with t1  as (

select *, row_number() over(partition by user_id,action order by action_date) as r1 from activity

)
, t2 as(

    select *, action_date-r1 as common_dates from t1
)
, t3 as(
    select 
    user_id,action,count(*) as streak_length,min(action_date) as start_date,max(action_date) as end_date
    from t2 
    group by common_dates,user_id,action
    having count(*)>=5
)
select * from t3 order by streak_length desc,user_id