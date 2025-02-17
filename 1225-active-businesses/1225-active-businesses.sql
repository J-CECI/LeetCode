# Write your MySQL query statement below
select e.business_id
from Events e
join(
select event_type,
       avg(occurrences) as avg_occu
from Events
group by event_type
) t on e.event_type = t.event_type
where e.occurrences > t.avg_occu
group by e.business_id
having count(*)>1;