# Write your MySQL query statement below
select em1.name
from Employee em1
join
(
select managerId,
count(*) as direct_reports
from Employee  
group by managerId
Having count(*)>=5 
) em2 on em1.id = em2.managerId;