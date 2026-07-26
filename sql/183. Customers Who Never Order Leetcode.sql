select name as Customers
from customers
where id not in (
    select id from (select customerid as id from orders ) o
);
