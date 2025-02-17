# Write your MySQL query statement below
(select name as results 
from MovieRating
join Users using(user_id)
group by name 
order by count(*) desc,name
limit 1)
union all
(select title  as result 
from Movies 
join MovieRating using(movie_id)
where year(created_at) =2020 && month(created_at)=02
group by title
order by avg(rating) desc,title
limit 1);