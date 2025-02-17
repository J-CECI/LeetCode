# Write your MySQL query statement below
with vote_counter as (
    select candidateId,
       count(*) as counter
    from Vote 
    group by candidateId
)

select c.name 
from Candidate c
join vote_counter v
on c.id =v.candidateId 
order by v.counter desc
limit 1;