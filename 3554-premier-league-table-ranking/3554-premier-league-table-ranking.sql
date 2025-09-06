# Write your MySQL query statement below
SELECT team_id
    , team_name
    , sum(wins * 3 + draws) AS points
    , rank() OVER
         (ORDER BY sum(wins * 3 + draws) DESC) AS position
FROM TeamStats
GROUP BY team_id, team_name
ORDER BY points DESC, team_name

