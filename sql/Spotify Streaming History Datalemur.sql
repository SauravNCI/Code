with t1 AS(select user_id, song_id,sum(song_plays) as song_plays
from songs_history group by user_id,song_id
union ALL
SELECT user_id,song_id,count(*) as song_plays
from songs_weekly
where listen_time<date('08/05/2022')
 group by user_id, song_id
)

select user_id,song_id,sum(song_plays) as song_plays
from t1 group by user_id,song_id
order by song_plays desc