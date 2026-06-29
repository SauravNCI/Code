



with recursive cte as (

    select E1.*, 1 as Levels
    from Employees E1
    where manager_id is null

    union all

    select E2.*,cte.levels+1 as Levels
    from Employees e2
    join cte on e2.manager_id = cte.employee_id

)
select * from cte;



with recursive cte as (

    select manager_id as ancestor_id, employee_id as descendant_id
    from Employees
    where manager_id is not null

    union all

    select cte.ancestor_id, e.employee_id as descendant_id
    from Employees e
    join cte on e.manager_id = cte.descendant_id

)
select * from cte;