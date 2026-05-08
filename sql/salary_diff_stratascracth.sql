WITH t1 AS (
    SELECT
        de.*,
        dd.department
    FROM db_employee de
    JOIN db_dept dd
        ON de.department_id = dd.id
)

SELECT ABS(
    (
        SELECT MAX(salary)
        FROM t1
        WHERE department = 'marketing'
    )
    -
    (
        SELECT MAX(salary)
        FROM t1
        WHERE department = 'engineering'
    )
) AS salary_difference;

Salaries Differences


Last Updated: May 2026

Easy
ID 10308

1156

Calculates the difference between the highest salaries in the marketing and engineering departments. Output just the absolute difference in salaries.