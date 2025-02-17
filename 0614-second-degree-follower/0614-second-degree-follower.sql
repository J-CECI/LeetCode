# Write your MySQL query statement below
select followee as follower ,
       count(*) as num
from Follow 
where followee in(
    select follower 
    from Follow
)
group by followee
having count(*) >=1
order by 1;  
