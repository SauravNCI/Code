SELECT 
    ah.nationality,
    COUNT(DISTINCT au.unit_id) AS number_of_units
FROM airbnb_hosts ah
JOIN airbnb_units au
    ON ah.host_id = au.host_id
WHERE ah.age < 30
  AND au.unit_type = 'Apartment'
GROUP BY ah.nationality
ORDER BY number_of_units DESC;

/*
Number Of Units Per Nationality


Last Updated: April 2026

Medium
ID 10156

228

Write a query that returns how many different apartment-type units (counted by distinct unit_id) are owned by people under 30, grouped by their nationality. Sort the results by the number of apartments in descending order
*/