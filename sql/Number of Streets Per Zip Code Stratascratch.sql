SELECT
    business_postal_code,
    COUNT(
        DISTINCT LOWER(
            CASE
                WHEN SUBSTRING_INDEX(business_address, ' ', 1) REGEXP '^[0-9]+$'
                THEN SUBSTRING_INDEX(
                         SUBSTRING_INDEX(business_address, ' ', 2),
                         ' ',
                         -1
                     )
                ELSE SUBSTRING_INDEX(business_address, ' ', 1)
            END
        )
    ) AS street_count
FROM sf_restaurant_health_violations
GROUP BY business_postal_code
ORDER BY street_count DESC,
         business_postal_code ASC;