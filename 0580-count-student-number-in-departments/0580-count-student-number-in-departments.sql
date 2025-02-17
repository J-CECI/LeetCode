# Write your MySQL query statement below
select d.dept_name,
       count(student_name) as student_number 
from Department d 
left outer join Student s
on d.dept_id = s.dept_id 
group by d.dept_name
order by student_number desc,
          d.dept_name ;