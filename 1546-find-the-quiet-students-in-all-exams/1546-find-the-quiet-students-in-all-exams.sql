# Write your MySQL query statement below
with cte as(
select exam_id,
       student_id,
       score,
       dense_rank() over (partition by exam_id order by score asc) as worst_rnk,
       dense_rank() over (partition by exam_id order by score desc) as best_rnk
from Exam )

select 
      distinct(e.student_id),
      s.student_name
from Exam e 
left join student s using(student_id)
where student_id not in (select student_id from cte where worst_rnk =1)
and 
 student_id not in (select student_id from cte where best_rnk =1)
order by student_id;