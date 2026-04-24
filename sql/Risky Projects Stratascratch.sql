Risky Projects


Last Updated: April 2026

Medium
ID 10304

350

You are given a set of projects and employee data. Each project has a name, a budget, and a specific duration, while each employee has an annual salary and may be assigned to one or more projects for particular periods. The task is to identify which projects are overbudget. A project is considered overbudget if the prorated cost of all employees assigned to it exceeds the project’s budget.


To solve this, you must prorate each employee's annual salary based on the exact period they work on a given project, relative to a full year. For example, if an employee works on a six-month project, only half of their annual salary should be attributed to that project. Sum these prorated salary amounts for all employees assigned to a project and compare the total with the project’s budget.


Your output should be a list of overbudget projects, where each entry includes the project’s name, its budget, and the total prorated employee expenses for that project. The total expenses should be rounded up to the nearest dollar. Assume all years have 365 days and disregard leap years.

Tables
linkedin_projects
linkedin_emp_projects
linkedin_employees

WITH project_costs AS (
    SELECT 
        lp.title,
        lp.budget,
        SUM(
            le.salary * 
            DATEDIFF(DAY, lp.start_date, lp.end_date) / 365.0
        ) AS total_spending
    FROM linkedin_projects lp
    JOIN linkedin_emp_projects lep 
        ON lp.id = lep.project_id
    JOIN linkedin_employees le 
        ON lep.emp_id = le.id
    GROUP BY lp.title, lp.budget
)

SELECT 
    title,
    budget,
    CEILING(total_spending) AS total_spending
FROM project_costs
WHERE total_spending > budget;