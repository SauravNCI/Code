WITH t1 AS (
    SELECT 
        s1.*,
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM subscription_events s2 
                WHERE s2.user_id = s1.user_id 
                AND s2.event_type = 'downgrade'
            ) THEN 1 ELSE 0 
        END AS has_downgrade
    FROM subscription_events s1
),

t2 AS (
    SELECT *,
        MAX(monthly_amount) OVER (PARTITION BY user_id) AS mx,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date) AS rnk
    FROM t1
),

t3 AS (
    SELECT t2.*,
    DATEDIFF(
        (SELECT t23.event_date 
         FROM t2 t23  
         WHERE t23.user_id = t2.user_id 
         ORDER BY t23.rnk DESC LIMIT 1),
        (SELECT t22.event_date 
         FROM t2 t22 
         WHERE t22.user_id = t2.user_id 
         ORDER BY t22.rnk ASC LIMIT 1)
    ) AS days_as_subscriber
    FROM t2
),

t4 AS (
    SELECT *
    FROM t3
    WHERE rnk = (
        SELECT MAX(t31.rnk) 
        FROM t3 t31 
        WHERE t31.user_id = t3.user_id
    )
    AND event_type != 'cancel'
)

SELECT 
    user_id,
    plan_name AS current_plan,
    monthly_amount AS current_monthly_amount,
    mx AS max_historical_amount,
    days_as_subscriber
FROM t4
WHERE 
    has_downgrade = 1
    AND monthly_amount < mx / 2
    AND days_as_subscriber >= 60
ORDER BY days_as_subscriber DESC, user_id ASC;