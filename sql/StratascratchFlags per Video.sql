Flags per Video


Last Updated: April 2026

Medium
ID 2102

133

For each video, find how many unique users flagged it. A unique user can be identified using the combination of their first name and last name. Do not consider rows in which there is no flag ID.

with t1 as(select
video_id
from user_flags
where flag_id is not null
group by video_id,user_firstname,user_lastname)
select video_id, count(*) as num_unique_users from t1 group by video_id