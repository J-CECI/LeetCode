# Write your MySQL query statement below
select id,
case when p_id is null then 'Root' 
     when id  in (select a.p_id from Tree a) then 'Inner'
    else 'Leaf'
    end as type
from Tree
order by id;