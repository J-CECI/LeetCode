# Write your MySQL query statement below
select p.session_id 
from Playback p
where (session_id) not in (
    select p.session_id 
    from Playback p
    left join Ads a
    on p.customer_id = a.customer_id
    where a.timestamp between p.start_time and p.end_time 
);