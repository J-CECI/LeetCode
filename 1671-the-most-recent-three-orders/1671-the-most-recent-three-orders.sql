# Write your MySQL query statement below
select customer_name, customer_id, order_id, order_date
from
(select name as customer_name,
        c.customer_id,
        order_id,
        order_date,
        rank() over (partition by c.customer_id order by order_date desc ) rnk  
from Customers c
inner join orders o 
on c.customer_id = o.customer_id) temp
where rnk<=3
order by customer_name,
        customer_id,
        order_date desc;