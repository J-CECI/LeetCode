# Write your MySQL query statement below
select t.team_id,
       t.team_name,
sum(case 
        when t.team_id = m.host_team   and m.host_goals > m.guest_goals  then 3
        when t.team_id = m.host_team   and m.host_goals = m.guest_goals  then 1
        when t.team_id = m.guest_team  and m.host_goals < m.guest_goals  then 3
        when t.team_id = m.guest_team  and m.host_goals = m.guest_goals  then 1
    else 0
    end ) as num_points

from Teams as t
left join Matches as m on t.team_id = m.host_team   or t.team_id = m.guest_team
group by t.team_id
order by num_points desc , team_id asc;