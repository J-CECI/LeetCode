# Write your MySQL query statement below
with cte as (
    select  v.fuel_type,
            v.driver_id,
            round(avg(t.rating),2) as rating,
            sum(t.distance) as distance,
            min(d.accidents) as accidents
from Vehicles as v
join Trips  as t on v.vehicle_id =t.vehicle_id 
join Drivers as d on v.driver_id  = d.driver_id 
group by fuel_type,
      driver_id
)

select fuel_type,
       driver_id,
       rating,
       distance
from(
select fuel_type,
       driver_id,
       rating,
       distance,
rank() over( partition by fuel_type order by rating desc, distance desc, accidents asc) 'rank'
from cte ) t0
where t0.rank = 1
order by fuel_type asc;