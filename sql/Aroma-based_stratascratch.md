Aroma-based Winery Search.


Last Updated: March 2026



Find wineries producing wines with aromas of plum, cherry, rose, or hazelnut (singular form only). To make things simpler, exclude any wine descriptions that contain the plural forms (ex. cherries).


id	country	description	designation	points	price	province	region_1	region_2	variety	winery
126576	US	Rich and round, this offers plenty of concentrated blackberry notes enveloped in warm spices and supple oak. There's a hint of green tomato leaves throughout, but the lush fruit combined with sturdy grape tannins and high acidity would pair well with fatty short ribs or braised pork.	Estate Club	87	32	Virginia	Virginia		Merlot	Veramar
127077	Italy	This luminous sparkler offers measured aromas of yellow fruit and honey and delivers a broad, wide approach in the mouth. The wine's texture is creamy and full and there is a spicy point of effervescence on the palate.	Extra Dry	85	19	Veneto	Prosecco di Valdobbiadene		Prosecco	Varaschin


SELECT DISTINCT winery
FROM winemag_p1
WHERE description REGEXP '\\b(plum|cherry|rose|hazelnut)\\b'
  AND description NOT REGEXP '\\b(plums|cherries|roses|hazelnuts)\\b';