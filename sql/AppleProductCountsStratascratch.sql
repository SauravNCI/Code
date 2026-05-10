with t as(
select playbook_events.user_id,device,language
from playbook_events join playbook_users
on playbook_events.user_id = playbook_users.user_id
),
 t1 as(
select language, count(distinct(user_id)) as u1 from t group by language 
)
, t2 as(
select language, count(distinct(user_id)) u2 from t where device = 'macbook pro' or device = 'iphone 5s' or device = 'ipad air' group by language 
)
select t1.language, t1.u1 as total_user, t2.u2 as apple_user
from  t1 left join t2
on t1.language = t2.language order by total_user desc

Apple Product Counts


Last Updated: May 2026

Medium
ID 10141

235

We’re analyzing user data to understand how popular Apple devices are among users who have performed at least one event on the platform. Specifically, we want to measure this popularity across different languages. Count the number of distinct users using Apple devices —limited to "macbook pro", "iphone 5s", and "ipad air" — and compare it to the total number of users per language.


Present the results with the language, the number of Apple users, and the total number of users for each language. Finally, sort the results so that languages with the highest total user count appear first.

Tables
playbook_events
playbook_users
More about this question
Hints
Expected Output
playbook_events
Preview
user_id	occurred_at	event_type	event_name	location	device
6991	2014-06-09 18:26:54	engagement	home_page	United States	iphone 5
18851	2014-08-29 13:18:38	signup_flow	enter_info	Russia	asus chromebook
14998	2014-07-01 12:47:56	engagement	login	France	hp pavilion desktop
8186	2014-05-23 10:44:16	engagement	home_page	Italy	macbook pro
9626	2014-07-31 17:15:14	engagement	login	Russia	nexus 7
16460	2014-07-24 18:43:19	signup_flow	create_user	United States	samsung galaxy note
10101	2014-08-27 05:54:28	engagement	home_page	Singapore	dell inspiron notebook
2670	2014-05-10 10:03:34	engagement	like_message	United States	nexus 7
8708	2014-05-26 10:42:12	engagement	send_message	Australia	macbook pro
167	2014-07-30 19:39:13	engagement	view_inbox	United Arab Emirates	lenovo thinkpad
12725	2014-06-17 08:03:49	engagement	home_page	Brazil	macbook pro
14014	2014-07-06 16:24:43	engagement	view_inbox	Japan	macbook pro
13536	2014-06-18 09:34:08	engagement	send_message	United States	nexus 5
2663	2014-06-13 07:45:26	engagement	home_page	United States	nokia lumia 635
8149	2014-06-06 15:35:24	engagement	like_message	Australia	samsung galaxy s4
3152	2014-05-20 17:57:00	engagement	home_page	Venezuela	iphone 5
11496	2014-08-28 07:45:32	engagement	view_inbox	United States	lenovo thinkpad
2755	2014-05-05 14:14:56	engagement	view_inbox	France	samsung galaxy s4
3422	2014-07-03 14:09:37	engagement	send_message	United States	kindle fire
2360	2014-06-02 19:53:13	engagement	search_click_result_9	United States	iphone 4s
10061	2014-08-18 09:32:46	engagement	view_inbox	Spain	macbook pro
12740	2014-05-21 00:57:22	signup_flow	enter_email	United Kingdom	iphone 4s
7849	2014-06-16 15:53:29	engagement	home_page	Japan	nexus 7
1002	2014-05-16 09:33:41	engagement	view_inbox	Canada	iphone 5s
11836	2014-08-03 16:12:09	engagement	send_message	United States	iphone 4s
6836	2014-08-01 14:58:53	engagement	view_inbox	United Kingdom	ipad air
6663	2014-06-16 12:04:49	engagement	like_message	Australia	asus chromebook
14653	2014-07-02 13:40:34	engagement	login	Australia	macbook pro
2719	2014-08-17 15:19:21	engagement	view_inbox	India	iphone 4s
2670	2014-05-11 13:58:13	engagement	home_page	United States	iphone 5s
3067	2014-07-29 07:24:25	engagement	home_page	Canada	iphone 5s
5108	2014-05-16 14:41:18	engagement	like_message	Canada	samsung galaxy s4
5874	2014-07-31 14:55:05	engagement	search_run	Russia	iphone 5
2267	2014-07-18 09:57:10	engagement	search_autocomplete	Brazil	macbook pro
3526	2014-05-09 12:49:24	engagement	home_page	United States	hp pavilion desktop
10323	2014-05-19 17:08:19	engagement	view_inbox	Switzerland	hp pavilion desktop
11824	2014-05-20 07:22:14	engagement	home_page	Saudi Arabia	ipad mini
12396	2014-05-14 18:10:21	engagement	view_inbox	United Kingdom	hp pavilion desktop
13056	2014-08-12 13:45:27	engagement	home_page	Germany	ipad air
6493	2014-05-04 10:33:59	engagement	search_run	United States	iphone 5
12047	2014-05-25 18:56:39	engagement	search_autocomplete	Austria	macbook air
10516	2014-07-22 17:35:33	engagement	send_message	Singapore	dell inspiron notebook
3076	2014-08-08 12:03:34	engagement	send_message	United States	dell inspiron notebook
9863	2014-07-11 08:59:44	engagement	view_inbox	Philippines	acer aspire desktop
9915	2014-05-01 09:34:10	engagement	view_inbox	Indonesia	macbook pro
175	2014-07-23 09:32:20	engagement	home_page	Russia	iphone 4s
10350	2014-06-16 15:28:22	engagement	home_page	United States	iphone 5
9283	2014-06-25 13:47:44	engagement	search_click_result_3	Canada	dell inspiron notebook
10394	2014-05-27 06:50:52	engagement	home_page	Japan	macbook pro
13397	2014-08-18 15:04:25	engagement	view_inbox	Japan	macbook air
1078	2014-06-09 17:46:15	engagement	home_page	Germany	ipad mini
7393	2014-08-08 12:32:17	engagement	search_autocomplete	Japan	acer aspire desktop
4765	2014-08-29 11:09:56	engagement	search_autocomplete	United States	macbook pro
17067	2014-08-04 19:01:43	signup_flow	complete_signup	United States	lenovo thinkpad
13597	2014-06-05 20:28:17	signup_flow	enter_email	Netherlands	nexus 5
8258	2014-05-08 09:34:53	engagement	home_page	United States	samsung galaxy note
10523	2014-07-02 09:16:21	engagement	like_message	Canada	samsumg galaxy tablet
2242	2014-08-03 18:49:13	engagement	home_page	United Kingdom	iphone 5
11595	2014-07-15 17:18:47	engagement	view_inbox	Mexico	hp pavilion desktop
9985	2014-07-28 09:34:16	engagement	like_message	Sweden	ipad air
15725	2014-07-12 18:41:29	engagement	view_inbox	Japan	lenovo thinkpad
4370	2014-06-19 17:28:52	engagement	like_message	Russia	iphone 5
13466	2014-06-03 10:52:18	engagement	search_autocomplete	Hong Kong	macbook air
8866	2014-08-05 08:34:57	engagement	home_page	United States	dell inspiron desktop
10310	2014-07-18 11:54:13	engagement	send_message	Brazil	amazon fire phone
13067	2014-07-23 04:16:36	engagement	like_message	United States	lenovo thinkpad
2171	2014-08-26 07:29:39	engagement	send_message	United States	asus chromebook
6622	2014-06-06 10:08:39	engagement	search_click_result_8	United States	acer aspire notebook
12548	2014-06-05 13:46:41	engagement	login	Germany	nokia lumia 635
12540	2014-05-16 14:20:55	signup_flow	create_user	Russia	lenovo thinkpad
9876	2014-07-04 13:22:49	engagement	search_run	United States	samsung galaxy s4
8716	2014-08-26 10:28:28	engagement	search_autocomplete	France	iphone 5
8740	2014-07-26 09:39:44	engagement	search_autocomplete	United States	nexus 10
12688	2014-07-11 18:00:37	engagement	search_autocomplete	Germany	hp pavilion desktop
5109	2014-08-23 06:02:53	engagement	login	United States	dell inspiron desktop
6261	2014-05-19 13:39:41	engagement	login	India	iphone 5
11264	2014-07-17 17:53:21	engagement	view_inbox	Taiwan	lenovo thinkpad
5298	2014-06-07 18:28:56	engagement	home_page	Brazil	asus chromebook
14726	2014-07-15 12:08:40	engagement	home_page	United Kingdom	macbook pro
13433	2014-07-26 06:48:34	engagement	like_message	United States	dell inspiron notebook
264	2014-05-30 19:36:44	engagement	login	Venezuela	samsung galaxy s4
108	2014-07-04 21:48:01	engagement	login	Mexico	lenovo thinkpad
264	2014-06-05 09:23:02	engagement	login	Venezuela	dell inspiron desktop
251	2014-07-29 14:32:29	engagement	login	Argentina	ipad air
108	2014-07-08 07:43:11	engagement	login	Mexico	hp pavilion desktop
264	2014-05-20 17:46:07	engagement	login	Venezuela	dell inspiron desktop
251	2014-08-06 15:24:42	engagement	login	Argentina	macbook air
238	2014-07-16 14:28:28	engagement	login	Venezuela	samsung galaxy note
251	2014-08-02 10:47:41	engagement	login	Argentina	macbook air
108	2014-07-21 17:34:43	engagement	login	Mexico	hp pavilion desktop
12103	2014-06-25 11:10:04	engagement	like_message	Argentina	macbook pro
16170	2014-08-23 18:53:20	engagement	like_message	Argentina	macbook pro
12103	2014-06-19 19:45:39	engagement	home_page	Argentina	macbook pro
12103	2014-06-25 11:08:39	engagement	like_message	Argentina	macbook pro
16170	2014-08-25 13:32:34	engagement	home_page	Argentina	macbook pro
16170	2014-08-22 13:33:08	engagement	home_page	Argentina	macbook pro
16170	2014-08-19 11:07:59	engagement	login	Argentina	macbook pro
12103	2014-06-25 11:07:03	engagement	login	Argentina	macbook pro
12103	2014-06-19 19:47:14	engagement	home_page	Argentina	macbook pro
12103	2014-06-18 16:00:16	engagement	search_autocomplete	Argentina	macbook pro
99999	2014-07-28 17:10:00	engagement	home_page	Argentina	macbook pro
88888	2014-07-21 12:00:00	engagement	home_page	Argentina	macbook pro
device:
text
event_name:
text
event_type:
text
location:
text
occurred_at:
timestamp without time zone
user_id:
bigint
playbook_users
Preview
user_id	created_at	company_id	language	activated_at	state
11	2013-01-01 04:41:13	1	german	2013-01-01	active
52	2013-01-05 15:30:45	2866	spanish	2013-01-05	active
52	2013-01-05 15:30:45	2866	german	2013-01-05	active
108	2013-01-10 11:04:58	1848	spanish	2013-01-10	active
167	2013-01-16 20:40:24	6709	arabic	2013-01-16	active
175	2013-01-16 11:22:22	4797	russian	2013-01-16	active
238	2013-01-23 11:04:23	5027	spanish	2013-01-23	active
251	2013-01-24 13:41:38	6	spanish	2013-01-24	active
264	2013-01-25 17:53:16	9801	spanish	2013-01-25	active
358	2013-02-03 08:00:45	11965	italian	2013-02-03	active
738	2013-03-08 01:45:22	123	english	2013-03-08	active
765	2013-03-11 08:00:42	2398	japanese	2013-03-11	active
771	2013-03-11 08:53:48	12469	english	2013-03-11	active
771	2013-03-11 08:53:48	12469	german	2013-03-11	active
1002	2013-03-29 18:04:56	6127	english	2013-03-29	active
1078	2013-04-04 08:14:01	6218	german	2013-04-04	active
1085	2013-04-04 19:39:33	10262	german	2013-04-04	active
1543	2013-05-06 02:24:34	57	spanish	2013-05-06	active
2171	2013-06-13 10:45:42	2	english	2013-06-13	active
2242	2013-06-18 17:00:22	3820	english	2013-06-18	active
2267	2013-06-19 09:48:49	2171	spanish	2013-06-19	active
2360	2013-06-25 08:09:02	1691	english	2013-06-25	active
2488	2013-07-02 16:15:01	5632	spanish	2013-07-02	active
2581	2013-07-07 11:17:32	8656	english	2013-07-07	active
2663	2013-07-11 12:12:53	6140	english	2013-07-11	active
2670	2013-07-11 13:51:42	6126	spanish	2013-07-11	active
2719	2013-07-15 10:48:46	3696	indian	2013-07-15	active
2755	2013-07-17 21:42:26	11304	french	2013-07-17	active
2882	2013-07-23 11:10:20	6	italian	2013-07-23	active
3067	2013-08-01 16:09:41	2	english	2013-08-01	active
3076	2013-08-01 19:32:39	4497	english	2013-08-01	active
3091	2013-08-02 13:48:14	6919	english	2013-08-02	active
3147	2013-08-06 13:02:22	97	english	2013-08-06	active
3152	2013-08-06 15:00:55	2496	spanish	2013-08-06	active
3422	2013-08-19 13:55:25	4363	english	2013-08-19	active
3526	2013-08-23 13:03:49	9605	english	2013-08-23	active
3762	2013-09-03 13:52:00	1590	english	2013-09-03	active
3768	2013-09-03 14:58:23	47	spanish	2013-09-03	active
3931	2013-09-11 13:53:37	12771	english	2013-09-11	active
3999	2013-09-13 09:18:19	1	japanese	2013-09-13	active
4370	2013-09-30 14:56:36	7	english	2013-09-30	active
4520	2013-10-05 18:49:34	2	japanese	2013-10-05	active
4558	2013-10-08 06:47:30	11891	arabic	2013-10-08	active
4662	2013-10-11 12:00:44	7556	english	2013-10-11	active
4765	2013-10-15 20:01:23	12819	english	2013-10-15	active
4814	2013-10-17 13:18:42	791	russian	2013-10-17	active
4814	2013-10-17 13:18:42	791	italian	2013-10-17	active
4841	2013-10-18 07:14:15	5	italian	2013-10-18	active
4969	2013-10-23 17:09:21	3207	english	2013-10-23	active
5001	2013-10-24 08:48:28	6727	english	2013-10-24	active
5108	2013-10-28 15:12:39	3619	english	2013-10-28	active
5109	2013-10-28 14:08:26	35	english	2013-10-28	active
5298	2013-11-04 16:59:50	136	portugese	2013-11-04	active
5298	2013-11-04 16:59:50	136	english	2013-11-04	active
5546	2013-11-13 18:01:06	7408	spanish	2013-11-13	active
5778	2013-11-21 16:30:50	5461	indian	2013-11-21	active
5805	2013-11-21 07:07:46	3	spanish	2013-11-21	active
5874	2013-11-25 17:07:46	1	russian	2013-11-25	active
5880	2013-11-25 14:41:05	91	french	2013-11-25	active
6018	2013-11-29 17:46:17	12698	chinese	2013-11-29	active
6021	2013-11-29 07:25:59	11650	english	2013-11-29	active
6107	2013-12-03 09:02:47	4	chinese	2013-12-03	active
6185	2013-12-05 21:44:09	511	german	2013-12-05	active
6261	2013-12-08 13:33:53	1	indian	2013-12-08	active
6396	2013-12-12 16:29:23	916	russian	2013-12-12	active
6434	2013-12-13 03:41:03	7788	russian	2013-12-13	active
6493	2013-12-16 10:28:54	2150	english	2013-12-16	active
6622	2013-12-20 13:23:50	25	english	2013-12-20	active
6663	2013-12-21 12:19:30	10460	english	2013-12-21	active
6746	2013-12-24 21:40:19	5319	english	2013-12-24	active
6766	2013-12-25 16:09:21	1935	english	2013-12-25	active
6836	2013-12-26 14:57:46	5508	english	2013-12-26	active
6938	2013-12-30 18:04:10	2137	english	2013-12-30	active
6991	2014-01-01 18:21:35	4073	english	2014-01-01	active
7043	2014-01-02 16:14:08	840	french	2014-01-02	active
7051	2014-01-02 13:06:16	4870	english	2014-01-02	active
7393	2014-01-14 15:40:25	189	japanese	2014-01-14	active
7457	2014-01-15 19:21:24	2331	english	2014-01-15	active
7527	2014-01-17 10:52:45	5010	english	2014-01-17	active
7849	2014-01-27 08:58:54	3570	japanese	2014-01-27	active
8149	2014-02-04 11:43:28	12442	english	2014-02-04	active
8186	2014-02-05 07:31:44	10826	italian	2014-02-05	active
8227	2014-02-06 05:42:56	7537	english	2014-02-06	active
8258	2014-02-06 17:39:15	2024	english	2014-02-06	active
8359	2014-02-10 15:08:20	6548	english	2014-02-10	active
8452	2014-02-12 14:20:52	28	english	2014-02-12	active
8483	2014-02-13 23:59:06	421	english	2014-02-14	active
8676	2014-02-18 14:47:15	9622	english	2014-02-18	active
8685	2014-02-18 16:50:07	3848	japanese	2014-02-18	active
8708	2014-02-19 11:22:32	6	english	2014-02-19	active
8716	2014-02-19 21:22:05	7	french	2014-02-19	active
8740	2014-02-20 16:58:41	12824	english	2014-02-20	active
8866	2014-02-24 09:01:53	16	english	2014-02-24	active
9033	2014-02-27 02:53:10	80	english	2014-02-27	active
9283	2014-03-05 17:05:18	10208	english	2014-03-05	active
9293	2014-03-05 17:30:42	1	english	2014-03-05	active
9327	2014-03-06 18:33:09	9	italian	2014-03-06	active
9412	2014-03-08 14:45:05	2	japanese	2014-03-08	active
9620	2014-03-14 12:16:10	2368	japanese	2014-03-14	active
9626	2014-03-14 11:05:15	148	russian	2014-03-14	active
9652	2014-03-14 13:29:04	58	arabic	2014-03-14	active
9780	2014-03-18 16:59:08	7238	english	2014-03-18	active
9805	2014-03-18 17:29:14	3576	english	2014-03-18	active
9863	2014-03-19 15:21:27	15	english	2014-03-19	active
9876	2014-03-20 06:24:40	158	english	2014-03-20	active
9915	2014-03-20 18:59:49	9857	chinese	2014-03-20	active
9985	2014-03-23 08:38:17	3345	english	2014-03-23	active
10061	2014-03-24 10:35:36	49	english	2014-03-24	active
10101	2014-03-25 00:03:57	11968	chinese	2014-03-25	active
10246	2014-03-28 10:39:51	1	arabic	2014-03-28	active
10246	2014-03-28 10:39:51	1	spanish	2014-03-28	active
10283	2014-03-29 15:07:24	6618	spanish	2014-03-29	active
10310	2014-03-31 18:01:45	10260	portugese	2014-03-31	active
10323	2014-03-31 18:07:13	1932	french	2014-03-31	active
10350	2014-03-31 14:34:45	4	english	2014-03-31	active
10394	2014-04-01 19:34:54	7595	japanese	2014-04-01	active
10445	2014-04-02 14:46:21	95	english	2014-04-02	active
10513	2014-04-03 23:30:38	11551	english	2014-04-03	active
10516	2014-04-03 17:11:32	2498	english	2014-04-03	active
10523	2014-04-03 17:17:04	3740	english	2014-04-03	active
10543	2014-04-04 03:41:01	5182	russian	2014-04-04	active
10607	2014-04-05 09:54:52	10548	english	2014-04-05	active
10610	2014-04-05 07:31:28	8663	english	2014-04-05	active
10729	2014-04-08 11:17:10	670	english	2014-04-08	active
10740	2014-04-09 20:15:17	7361	french	2014-04-09	active
10770	2014-04-09 08:02:29	5934	spanish	2014-04-09	active
11043	2014-04-15 14:05:21	5785	japanese	2014-04-15	active
11113	2014-04-17 14:52:39	4	english	2014-04-17	active
11180	2014-04-18 22:25:09	5203	english	2014-04-18	active
11233	2014-04-20 12:10:25	7022	spanish	2014-04-20	active
11264	2014-04-21 12:43:36	4	chinese	2014-04-21	active
11496	2014-04-25 15:05:09	3919	english	2014-04-25	active
11508	2014-04-25 11:52:49	11539	english	2014-04-25	active
11594	2014-04-28 15:20:30	8	french	2014-04-28	active
11595	2014-04-28 18:30:09	5136	spanish	2014-04-28	active
11654	2014-04-29 01:22:10	1246	english	2014-04-29	active
11767	2014-05-01 09:51:52	143	arabic	2014-05-01	active
11802	2014-05-01 15:24:17	1038	english	2014-05-01	active
11824	2014-05-02 17:08:08	6051	arabic	2014-05-02	active
11836	2014-05-02 04:05:53	2525	english	2014-05-02	active
11884	2014-05-03 01:29:43	11770	english	2014-05-03	active
12047	2014-05-07 09:13:52	1063	french	2014-05-07	active
12103	2014-05-07 16:21:56	1	english	2014-05-07	active
12129	2014-05-08 18:04:14	3	english	2014-05-08	active
12214	2014-05-09 17:27:55	6207	japanese	2014-05-09	active
12243	2014-05-10 03:11:26	9502	spanish	2014-05-10	active
12249	2014-05-11 17:27:43	16	english	2014-05-11	active
12250	2014-05-11 13:53:15	7246	spanish	2014-05-11	active
12285	2014-05-12 14:30:17	6934	english	2014-05-12	active
12301	2014-05-12 14:31:24	9933	spanish	2014-05-12	active
12396	2014-05-14 18:07:07	4430	french	2014-05-14	active
12400	2014-05-14 13:58:51	243	german	2014-05-14	active
12446	2014-05-14 15:02:48	46	german	2014-05-14	active
12462	2014-05-15 09:51:58	14	arabic	2014-05-15	active
12467	2014-05-15 09:06:25	4134	english	2014-05-15	active
12470	2014-05-15 22:26:28	264	english	2014-05-15	active
12540	2014-05-16 14:20:55	18	russian	2014-05-16	active
12548	2014-05-16 12:23:21	1	english	2014-05-16	active
12620	2014-05-19 03:38:32	11444	english	2014-05-19	active
12635	2014-05-19 03:28:00	3	english	2014-05-19	active
12657	2014-05-19 21:58:54	8039	arabic	2014-05-19	active
12688	2014-05-20 09:33:20	13	german	2014-05-20	active
12725	2014-05-20 15:51:49	2	portugese	2014-05-20	active
12740	2014-05-21 00:56:53	498	english	2014-05-21	active
12789	2014-05-21 19:09:20	8726	german	2014-05-21	active
12919	2014-05-23 14:22:05	10205	russian	2014-05-23	active
13007	2014-05-26 05:10:17	1	english	2014-05-26	active
13056	2014-05-27 13:39:18	7403	german	2014-05-27	active
13067	2014-05-27 15:38:03	205	english	2014-05-27	active
13194	2014-05-29 12:18:17	1	spanish	2014-05-29	active
13363	2014-06-02 12:04:29	256	english	2014-06-02	active
13397	2014-06-02 12:08:05	2	japanese	2014-06-02	active
13433	2014-06-03 13:36:48	6806	english	2014-06-03	active
13466	2014-06-03 10:49:58	1	chinese	2014-06-03	active
13536	2014-06-04 17:44:11	21	spanish	2014-06-04	active
13544	2014-06-04 16:28:25	23	spanish	2014-06-04	active
13559	2014-06-05 11:30:05	11716	english	2014-06-05	active
13606	2014-06-05 12:01:59	10423	french	2014-06-05	active
13678	2014-06-06 15:52:52	7039	english	2014-06-06	active
13741	2014-06-09 09:29:23	4	english	2014-06-09	active
13763	2014-06-09 10:21:14	1	english	2014-06-09	active
13823	2014-06-10 08:13:06	8157	spanish	2014-06-10	active
13909	2014-06-11 13:02:16	4897	english	2014-06-11	active
13919	2014-06-11 10:22:45	7311	russian	2014-06-11	active
13988	2014-06-12 17:10:38	94	english	2014-06-12	active
13989	2014-06-12 10:08:17	11638	english	2014-06-12	active
13990	2014-06-12 17:37:21	5	english	2014-06-12	active
14014	2014-06-13 16:20:34	3201	japanese	2014-06-13	active
14081	2014-06-15 13:06:42	1	portugese	2014-06-15	active
14089	2014-06-16 16:04:24	4258	english	2014-06-16	active
14166	2014-06-16 13:25:47	1926	portugese	2014-06-16	active
14173	2014-06-17 12:35:51	18	english	2014-06-17	active
14212	2014-06-17 06:25:43	9597	indian	2014-06-17	active
14235	2014-06-17 17:31:56	144	french	2014-06-17	active
14307	2014-06-18 10:08:29	547	english	2014-06-18	active
14313	2014-06-18 22:22:44	6486	indian	2014-06-18	active
14320	2014-06-19 10:56:10	7705	spanish	2014-06-19	active
14354	2014-06-19 11:48:15	6	spanish	2014-06-19	active
14382	2014-06-19 12:39:35	12606	chinese	2014-06-19	active
14448	2014-06-20 03:25:55	26	english	2014-06-20	active
14491	2014-06-22 18:02:41	4639	english	2014-06-22	active
14637	2014-06-24 09:55:21	12852	english	2014-06-24	active
14653	2014-06-25 13:37:49	8475	english	2014-06-25	active
14686	2014-06-25 21:26:17	4	english	2014-06-25	active
14726	2014-06-26 18:14:46	12152	english	2014-06-26	active
14727	2014-06-26 14:52:38	76	spanish	2014-06-26	active
14739	2014-06-26 14:19:29	4	french	2014-06-26	active
14743	2014-06-26 11:20:45	11	english	2014-06-26	active
14746	2014-06-26 16:15:53	344	english	2014-06-26	active
14849	2014-06-27 10:15:42	10219	indian	2014-06-27	active
14885	2014-06-28 18:37:56	11326	arabic	2014-06-28	active
14918	2014-06-30 10:32:30	6955	spanish	2014-06-30	active
14998	2014-07-01 12:46:20	373	english	2014-07-01	active
15725	2014-07-12 18:39:36	2777	japanese	2014-07-12	active
16170	2014-07-21 11:05:45	6354	english	2014-07-21	active
17067	2014-08-04 19:00:06	1416	english	2014-08-04	active
18851	2014-08-29 13:17:38	11617	russian	2014-08-29	active
13597	2014-06-05 20:27:44	12190	english		pending
16460	2014-07-24 18:43:19	9436	english		pending
99999	2014-07-28 16:48:22	9436	spanish	2014-07-28	active
88888	2014-07-20 10:00:00	5555	spanish	2014-07-20	active
88888	2014-07-20 10:00:00	5555	english	2014-07-20	active
activated_at:
date
company_id:
bigint
created_at:
timestamp without time zone
language:
text
state:
text
user_id:
bigint