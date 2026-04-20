602. Friend Requests II: Who Has the Most Friends
Solved
Medium
Topics
premium lock icon
Companies
Hint
SQL Schema
Pandas Schema
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

with cte as (select id, count(*) as num
from (
    select requester_id as id from requestaccepted
    union all
    select accepter_id as id from requestaccepted
) x group by id
)
select id, num from cte order by num desc limit 1