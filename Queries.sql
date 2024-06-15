/* 1. total runs scored by teams */
select batting_team, sum(runs_off_bat) as total_runs
from deliveries
group by batting_team
order by total_runs desc;

/* 2. team wins and losses */
select winner, count(*) as matches_won
from matches
where winner is not null
group by winner
order by matches_won desc;

/* 3. net run rate calculation */
select team,
	sum(runs_for) as total_runs_for,
	sum(overs_for) as total_overs_for,
	sum(runs_against) as total_runs_against,
	sum(overs_against) as total_overs_against,
	(sum(runs_for) / sum(overs_for)) - (sum(runs_against)/sum(overs_against)) as net_run_rate
from points_table
group by team
order by net_run_rate desc;

/* 4. Batting Strike Rates */
select striker, 
count(*) as balls_faced,
sum(runs_off_bat) as total_runs,
(sum(runs_off_bat) / count(*)) * 100 as strike_rate
from deliveries
group by striker
Having balls_faced >=100
order by strike_rate desc;

/* 5. top run scorers */
select striker,
sum(runs_off_bat) as total_runs
from deliveries
group by striker
order by total_runs desc;

/* 6. best bowling figures */
SELECT bowler,
       MAX(runs_conceded) AS runs_conceded,
       MIN(wickets) AS wickets_taken
FROM (
    SELECT bowler,
           SUM(runs_off_bat) AS runs_conceded,
           COUNT(*) AS wickets
    FROM deliveries
    WHERE wicket_type IS NOT NULL
    GROUP BY bowler, match_id
) AS bowling_stats
GROUP BY bowler
ORDER BY wickets_taken DESC, runs_conceded ASC;

/* 7. win percentage based on toss */
SELECT toss_decision,
       COUNT(*) AS matches_count,
       SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS toss_winner_wins,
       SUM(CASE WHEN toss_winner <> winner THEN 1 ELSE 0 END) AS toss_winner_losses
FROM matches
GROUP BY toss_decision;

/* 8. Avg Runs scored in powerplay by each team */
SELECT batting_team,
       AVG(total_runs_powerplay) AS avg_powerplay_runs
FROM (
    SELECT batting_team,
           match_id,
           SUM(runs_off_bat + extras) AS total_runs_powerplay
    FROM deliveries
    WHERE ball <= 10.0  
    GROUP BY match_id, batting_team
) AS powerplay_stats
GROUP BY batting_team
ORDER BY avg_powerplay_runs DESC;

-- 9. Most 250+ scores by a team --
SELECT batting_team,
       COUNT(*) AS num_matches_above_250
FROM (
    SELECT match_id,
           batting_team,
           SUM(runs_off_bat + extras) AS total_runs
    FROM deliveries
    GROUP BY match_id, batting_team
    HAVING total_runs >= 250
) AS matches_above_250
GROUP BY batting_team
HAVING num_matches_above_250 > 0
ORDER BY num_matches_above_250 DESC;

-- 10. Best Fielding Sides --
SELECT 
    bowling_team AS fielding_team,
    COUNT(DISTINCT match_id) AS matches_played,
    SUM(CASE WHEN wicket_type = 'caught' THEN 1 ELSE 0 END) AS total_catches,
    SUM(CASE WHEN wicket_type = 'run out' OR other_wicket_type = 'run out' THEN 1 ELSE 0 END) AS total_run_outs,
    SUM(CASE WHEN wicket_type = 'stumped' THEN 1 ELSE 0 END) AS total_stumpings,
    SUM(CASE WHEN wicket_type IN ('caught', 'run out', 'stumped') THEN 1 ELSE 0 END) AS total_fielding_actions
FROM 
    deliveries
GROUP BY 
    fielding_team
ORDER BY 
    total_fielding_actions DESC;

-- 11. Matches won by first batting vs second batting
SELECT 
    COUNT(CASE WHEN toss_decision = 'bat' AND winner = team1 THEN match_number END) AS matches_won_batting_first,
    COUNT(CASE WHEN toss_decision = 'field' AND winner = team2 THEN match_number END) AS matches_won_batting_second
FROM 
    matches;
