Cities With The Most Expensive Homes


Last Updated: April 2026

Medium
ID 10315

130

Write a query that identifies cities with higher than average home prices when compared to the national average. Output the city names.

Table

WITH city_avg AS (
    SELECT city, AVG(mkt_price) AS avg_city_price
    FROM zillow_transactions
    GROUP BY city
),
national_avg AS (
    SELECT AVG(mkt_price) AS avg_national_price
    FROM zillow_transactions
)
SELECT c.city
FROM city_avg c
CROSS JOIN national_avg n
WHERE c.avg_city_price > n.avg_national_price;