# Write your MySQL query statement below
select customer_id,
       product_id,
       product_name
from (
select o.customer_id,
       o.product_id,
       p.product_name,
rank() over(partition by customer_id order by count(o.product_id) desc) as rnk
from Orders o
join Products p 
on o.product_id = p.product_id
group by customer_id,product_id
) t0
where rnk = 1 
order by customer_id,product_id;