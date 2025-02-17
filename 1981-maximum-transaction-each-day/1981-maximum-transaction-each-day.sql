# Write your MySQL query statement below
select transaction_id
from Transactions
where (date(day),amount) in(
    select date(day),
           max(amount) as am
    from Transactions
    group by date(day)
)
order by transaction_id;