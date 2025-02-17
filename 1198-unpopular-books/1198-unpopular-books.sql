# Write your MySQL query statement below
select b.book_id,
       b.name
from Books b
where available_from < '2019-05-23'
and book_id not in (
    select book_id
    from Orders
    where dispatch_date  between '2018-06-23' and '2019-06-23'
    group by book_id
    having sum(quantity) >= 10);