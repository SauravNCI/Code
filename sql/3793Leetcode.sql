
with t1 as
(select user_id,
count(*) as prompt_count,
round(avg(tokens),2) as avg_tokens
from prompts p
group by user_id
having count(*)>=3
)

select t1.user_id,prompt_count, avg_tokens
from t1
where (select count(tokens) from prompts where user_id = t1.user_id and tokens > t1.avg_tokens)>=1
order by avg_tokens desc,user_id
