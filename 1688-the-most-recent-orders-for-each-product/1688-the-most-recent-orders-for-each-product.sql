# Write your MySQL query statement below
with cte as(
select
       product_id,
       order_id,
       order_date,
       dense_rank() over (partition by product_id order by order_date desc ) as rnk 
from Orders )

select product_name,
       p.product_id,
       order_id,
       order_date
from Products p
join cte c on c.product_id = p.product_id
where rnk =1 
order by product_name,
         p.product_id,
         order_id;