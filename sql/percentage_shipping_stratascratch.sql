with t1 as(
    select 
    orders.*,customers.address
    from orders left join customers
    on orders.cust_id = customers.id
    where customers.address is not null and customers.address <>''

)
select 100*count(*)/(select count(distinct(orders.id)) as cnt from orders)  as percent_shipable from t1

Find the percentage of shipable orders


Last Updated: April 2026

Medium
ID 10090

131

Find the percentage of shipable orders.
Consider an order is shipable if the customer's address is known.
/*
id	cust_id	order_date	order_details	total_order_cost
1	3	2019-03-04	Coat	100
2	3	2019-03-01	Shoes	80
3	3	2019-03-07	Skirt	30
4	7	2019-02-01	Coat	25
5	7	2019-03-10	Shoes	80
6	15	2019-02-01	Boats	100
7	15	2019-01-11	Shirts	60
8	15	2019-03-11	Slipper	20
9	15	2019-03-01	Jeans	80
10	15	2019-03-09	Shirts	50
11	5	2019-02-01	Shoes	80
12	12	2019-01-11	Shirts	60
id	first_name	last_name	city	address	phone_number
8	John	Joseph	San Francisco		928-386-8164
7	Jill	Michael	Austin		813-297-0692
4	William	Daniel	Denver		813-368-1200
5	Henry	Jackson	Miami		808-601-7513
13	Emma	Isaac	Miami		808-690-5201
14	Liam	Samuel	Miami		808-555-5201
15	Mia	Owen	Miami		808-640-5201
1	Mark	Thomas	Arizona	4476 Parkway Drive	602-993-5916
12	Eva	Lucas	Arizona	4379 Skips Lane	301-509-8805
6	Jack	Aiden	Arizona	4833 Coplin Avenue	480-303-1527
2	Mona	Adrian	Los Angeles	1958 Peck Court	714-409-9432
10	Lili	Oliver	Los Angeles	3832 Euclid Avenue	530-695-1180
3	Farida	Joseph	San Francisco	3153 Rhapsody Street	813-368-1200
9	Justin	Alexander	Denver	4470 McKinley Avenue	970-433-7589
11	Frank	Jacob	Miami	1299 Randall Drive	808-590-5201


*/