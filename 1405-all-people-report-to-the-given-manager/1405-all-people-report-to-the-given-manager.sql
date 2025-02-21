# Write your MySQL query statement below
select employee_id
from Employees 
where manager_id in(
    select employee_id
    from Employees
    where manager_id in (
        select employee_id 
        from Employees
        where manager_id =1
    )
)
and manager_id != employee_id;