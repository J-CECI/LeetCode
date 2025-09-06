# Write your MySQL query statement below
select user_id
from loans
where loan_type = 'Mortgage' or loan_type = 'Refinance'
group by user_id
having count(distinct loan_type) = 2
order by user_id
