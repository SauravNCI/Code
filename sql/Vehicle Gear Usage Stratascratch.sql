Vehicle Gear Usage


Last Updated: April 2026

Medium
ID 10571

16

A company tracks data from its delivery vehicles. Every time a driver changes gears, the system records which vehicle ('car_id'), when it happened (timestamp in Unix epoch seconds), and which gear: P (Park), D (Drive), or R (Reverse).


Calculate how many total hours all vehicles spent in each gear. To determine the duration of a gear period, calculate the time difference between when that gear was engaged and when the next gear change occurred. For each vehicle's final gear change (which has no subsequent change recorded), assume the shift ended 2 hours after that final timestamp. Return gear and total hours.

Table
vehicle_telemetry

car_id	timestamp_epoch	gear
V-1001	1704088800	P
V-1001	1704097800	D
V-1001	1704102300	P
V-1001	1704103200	D
V-1001	1704105000	P
V-1001	1704105900	D
V-1001	1704111300	P
V-1001	1704114000	D
V-1001	1704118800	P
V-1001	1704119700	D
V-1001	1704124800	P
V-1002	1704092400	P
V-1002	1704099600	D
V-1002	1704101100	R
V-1002	1704101400	P
V-1002	1704102600	D
V-1002	1704107400	P
V-1002	1704110400	D
V-1002	1704123000	P
V-1003	1704087000	P
V-1003	1704096000	D
V-1003	1704105900	P
V-1003	1704108600	D
V-1003	1704110400	P
V-1003	1704111000	D
V-1003	1704117000	P
V-1003	1704117900	D
V-1003	1704129600	P
V-1004	1704177000	P
V-1004	1704186900	D
V-1004	1704195000	R
V-1004	1704195300	P
V-1004	1704196200	D
V-1004	1704202800	P
V-1004	1704205200	D
V-1004	1704213900	P
V-1005	1704179700	P
V-1005	1704187800	D
V-1005	1704189600	P
V-1005	1704190800	D
V-1005	1704199800	P
V-1005	1704203100	D
V-1005	1704204600	R
V-1005	1704204900	D
V-1005	1704210000	P
V-1006	1704261600	P
V-1006	1704271500	D
V-1006	1704285000	P
V-1006	1704287700	D
V-1006	1704289200	R
V-1006	1704289500	P
V-1006	1704290400	D
V-1006	1704302100	P

WITH t1 AS (
    SELECT 
        car_id,
        gear,
        timestamp_epoch,
        LEAD(timestamp_epoch, 1, timestamp_epoch + 7200) 
            OVER (PARTITION BY car_id ORDER BY timestamp_epoch) 
        - timestamp_epoch AS duration_seconds
    FROM vehicle_telemetry
)

SELECT 
    gear,
    SUM(duration_seconds) / 3600.0 AS total_hours
FROM t1
GROUP BY gear
ORDER BY gear;
