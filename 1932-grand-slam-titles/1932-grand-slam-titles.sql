select player_id,
       player_name,
sum(player_id = Wimbledon) + sum(player_id = Fr_open) + sum(player_id =US_open) + sum(player_id=Au_open) as grand_slams_count 
from Players
join Championships
on player_id = Wimbledon or player_id = Fr_open or player_id =US_open or player_id=Au_open
group by player_id;