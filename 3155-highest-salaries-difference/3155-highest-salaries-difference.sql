# Write your MySQL query statement below
select abs(max(m.salary) - max(e.salary)) as salary_difference 
from Salaries as m ,Salaries as e
where m.department   = 'Marketing' and e.department   = 'Engineering ';