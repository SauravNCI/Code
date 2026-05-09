Distances Traveled


Last Updated: February 2026

Medium
ID 10324

109

Find the top 10 users that have traveled the greatest distance. Output their id, name and a total distance traveled.



with t1 as(
select 
ll.user_id,lu.name, sum(ll.distance) as total_dis
from lyft_rides_log ll join lyft_users lu
on ll.user_id = lu.id  group by ll.user_id,lu.name)
select user_id,name,total_dis from t1 order by total_dis desc limit 10
 
/*
user_id	name	distance
1	Dustin Smith	78
1	Dustin Smith	35
1	Dustin Smith	87
2	Jay Ramirez	75
2	Jay Ramirez	39
3	Joseph Cooke	5
5	Sean Parker	92
7	Christopher Schmitt	96
8	Patrick Gutierrez	29
8	Patrick Gutierrez	74
8	Patrick Gutierrez	93
8	Patrick Gutierrez	47
9	Dennis Douglas	55
9	Dennis Douglas	15
9	Dennis Douglas	43
9	Dennis Douglas	93
10	Brenda Morris	90
11	Jeffery Hernandez	61
11	Jeffery Hernandez	40
11	Jeffery Hernandez	36
11	Jeffery Hernandez	69
12	David Rice	53
12	David Rice	11
12	David Rice	63
12	David Rice	30
13	Charles Foster	16
14	Keith Perez DVM	66
14	Keith Perez DVM	82
14	Keith Perez DVM	66
15	Dean Cuevas	8
15	Dean Cuevas	42
15	Dean Cuevas	92
17	Alexander Howell	24
17	Alexander Howell	91
17	Alexander Howell	90
18	Austin Robertson	27
19	Sherri Mcdaniel	64
20	Nancy Nguyen	30
20	Nancy Nguyen	25
20	Nancy Nguyen	45
20	Nancy Nguyen	50
21	Melody Ball	81
23	Joseph Hamilton	42
23	Joseph Hamilton	37
24	Kevin Fischer	58
24	Kevin Fischer	52
25	Crystal Berg	96
25	Crystal Berg	74
25	Crystal Berg	19
25	Crystal Berg	50
26	Barbara Larson	98
26	Barbara Larson	94
27	Jacqueline Heath	31
27	Jacqueline Heath	60
28	Eric Gardner	68
28	Eric Gardner	26
28	Eric Gardner	83
31	Shannon Green	24
31	Shannon Green	62
32	Stacy Collins	85
32	Stacy Collins	76
32	Stacy Collins	49
33	Donna Ortiz	83
34	Jennifer Simmons	85
34	Jennifer Simmons	67
34	Jennifer Simmons	61
34	Jennifer Simmons	64
36	Alyssa Shaw	18
36	Alyssa Shaw	10
37	Destiny Clark	10
37	Destiny Clark	38
38	Thomas Lara	82
39	Mark Diaz	13
39	Mark Diaz	68
40	Stacy Bryant	56
41	Howard Rose	89
42	Brian Schwartz	71
42	Brian Schwartz	85
43	Kimberly Potter	95
43	Kimberly Potter	77
43	Kimberly Potter	85
43	Kimberly Potter	9
43	Kimberly Potter	9
44	Cassidy Ryan	76
44	Cassidy Ryan	52
45	Benjamin Mcbride	11
46	Elizabeth Ward	91
46	Elizabeth Ward	17
47	Christina Price	98
47	Christina Price	70
47	Christina Price	88
47	Christina Price	35
47	Christina Price	37
48	Pamela Cox	29
48	Pamela Cox	58
48	Pamela Cox	94
49	Jessica Peterson	57
49	Jessica Peterson	73
50	Michael Nelson	89
50	Michael Nelson	46

id	user_id	distance
101	8	93
102	40	56
103	28	83
104	33	83
105	1	87
106	32	49
107	3	5
id	name
1	Dustin Smith
2	Jay Ramirez
3	Joseph Cooke
4	Melinda Young
5	Sean Parker
6	Ian Foster
7	Christopher Schmitt
8	Patrick Gutierrez
9	Dennis Douglas

*/