with cte1 as
(
    select T1.book_id 
    from
        (select * 
        from reading_sessions
        where session_rating<=2 
        ) T1
    where T1.book_id  in 
        (
        select book_id 
        from reading_sessions
        where session_rating>=4
        ) group by T1.book_id
    
)
, cte2 as
(
    select 
    r.book_id , sum(case when session_rating<=2 or session_rating>=4 then 1 else 0 end) as extreme_rating
   , max(session_rating) - min(session_rating) as rating_spread    
   ,  count(*) as total_session
    from reading_sessions r join cte1
    on r.book_id = cte1.book_id
    group by r.book_id

)

, cte3 as(

    select c2.book_id,title,author,genre,pages,rating_spread,
    
    round(1.0*extreme_rating/total_session,2) as polarization_score
    from cte2 c2 join books 
    on c2.book_id = books.book_id
    WHERE c2.total_session >= 5
)
select * from cte3
where polarization_score>=0.6
order by polarization_score desc, title desc


