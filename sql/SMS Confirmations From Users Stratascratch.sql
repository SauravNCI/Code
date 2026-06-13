WITH cte1 AS (
    SELECT DISTINCT fs.phone_number
    FROM fb_sms_sends fs
    JOIN fb_confirmers fc
      ON fs.phone_number = fc.phone_number
     AND fs.ds = fc.date
    WHERE fs.ds = '2020-08-04'
      AND fs.type = 'message'
)

SELECT
    100.0 * COUNT(*) /
    (SELECT COUNT(*)
     FROM fb_sms_sends
     WHERE ds = '2020-08-04'
       AND type = 'message') AS per
FROM cte1;