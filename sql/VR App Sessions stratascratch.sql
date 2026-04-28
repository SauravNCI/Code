VR App Sessions


Last Updated: April 2026

Medium
ID 10569

13

Your company operates a VR gaming platform where users can launch and play various virtual reality applications. The vr_sessions table records every session initiated by users, capturing when they started an app and when they exited. The platform analytics team needs to understand app popularity and usage patterns.


Calculate the total number of unique sessions for each VR application. A session is identified by a unique session_id. If the same session_id appears multiple times in the table (which can happen due to connection retries or logging issues), count it as only one session by keeping the record with the earliest start_time. Include all applications that have at least one session in your results. Return the app name and the total number of sessions.

Table
vr_sessions

with t1 as( 
    select *
    from vr_sessions v1 where v1.start_time = (select min(v2.start_time) from vr_sessions v2
    where v2.session_id = v1.session_id)
)
select app_name, count(*) from t1
group by app_name