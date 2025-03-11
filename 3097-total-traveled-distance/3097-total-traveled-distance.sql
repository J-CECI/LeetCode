# Write your MySQL query statement below
select u.user_id,
       u.name,
       ifnull(sum(distance),0) as 'traveled distance'
from Users as u
left join Rides  as r on u.user_id = r.user_id
group by u.user_id
order by u.user_id ;
