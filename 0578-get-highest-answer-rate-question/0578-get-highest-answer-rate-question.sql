# Write your MySQL query statement below
select question_id as survey_log
from Surveylog
group by question_id
order by sum(case when action = 'answer' then 1 else 0 end) / sum(case when action ='show' then 1 else 0 end) desc, #anser rate
         question_id asc
limit 1;