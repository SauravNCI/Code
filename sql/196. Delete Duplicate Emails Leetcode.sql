with cte as(
    select *, row_number() over(partition by email order by id) as r
    from person
)
delete  from cte
where r != 1


delete from
person 
where id not in(
  select id from( select min(id) as id from person 
    group by email) t
)