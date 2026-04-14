New Products



Calculate the net change in the number of products launched by companies in 2020 compared to 2019. Your output should include the company names and the net difference.
(Net difference = Number of products launched in 2020 - The number launched in 2019.)

Table
car_launches

year	company_name	product_name
2019	Toyota	Avalon
2019	Toyota	Camry
2020	Toyota	Corolla
2019	Honda	Accord
2019	Honda	Passport
2019	Honda	CR-V
2020	Honda	Pilot
2019	Honda	Civic
2020	Chevrolet	Trailblazer
2020	Chevrolet	Trax
2019	Chevrolet	Traverse
2020	Chevrolet	Blazer
2019	Ford	Figo
2020	Ford	Aspire
2019	Ford	Endeavour
2020	Jeep	Wrangler
2020	Jeep	Cherokee
2020	Jeep	Compass
2019	Jeep	Renegade
2019	Jeep	Gladiator

SELECT 
    company_name,
    COUNT(DISTINCT CASE WHEN year = 2020 THEN product_name END) -
    COUNT(DISTINCT CASE WHEN year = 2019 THEN product_name END) AS net_diff
FROM car_launches
GROUP BY company_name;