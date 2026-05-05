Share of Active Users


Last Updated: April 2026

Medium
ID 2005

168

Calculate the percentage of users who are both from the US and have an 'open' status, as indicated in the fb_active_users table.

WITH t1 AS (
    SELECT *
    FROM fb_active_users
    WHERE country = 'USA'
      AND status = 'open'
)
SELECT 
    100.0 * COUNT(t1.user_id) 
    / (SELECT COUNT(*) FROM fb_active_users) AS percentage
FROM t1;