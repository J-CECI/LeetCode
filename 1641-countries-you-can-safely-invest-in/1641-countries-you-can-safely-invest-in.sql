# Write your MySQL query statement
select co.name as country
from Person p 
inner join Country co on left(phone_number,3) = country_code
inner join Calls c on p.id = c.caller_id or p.id = c.callee_id 
group by co.name
having avg(duration) > (select avg(duration) from Calls); 