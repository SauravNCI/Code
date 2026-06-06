SELECT
    noc,
    MIN(year) AS first_year
FROM olympics_athletes_events
GROUP BY noc
ORDER BY first_year, noc;