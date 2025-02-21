# Write your MySQL query statement below
Select 
      user_id,
      max(wf) as biggest_window
from
( 
    select
          user_id,
         datediff(lead(visit_date, 1, '2021-01-01') over (partition by user_id order by visit_date),visit_date) as wf
    from 
        UserVisits 
) a
group by user_id
order by user_id;

