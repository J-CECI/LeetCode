# Write your MySQL query statement below
select p.product_id,
coalesce (
    case when p.category = d.category then price - (discount /100)*price
         else p.price 
         end,
p.price) as final_price,
       p.category
from Products as p
left join Discounts as d
on p.category = d.category
order by product_id;