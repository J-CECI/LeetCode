# Write your MySQL query statement below
with vote_count as (select voter,count(*) as vote_count from Votes group by voter),

votes as (
    select candidate,
    sum(1/vote_count) as votes 
    from Votes a 
    join  vote_count b
    where a.voter = b.voter and a.candidate is not null
    group by candidate
)

select candidate 
from votes 
where votes = (select max(votes) from votes)
order by candidate;