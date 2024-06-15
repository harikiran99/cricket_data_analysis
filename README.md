# cricket_data_analysis
[![Version Control](https://img.shields.io/badge/version%20control-git-blue)](https://git-scm.com/)
# Objective:
The goal of this project is to analyze cricket match data to derive insights and create visualizations that showcase various statistical aspects of the game.

# Data Sources:

# Deliveries Table:

Contains detailed information about each ball bowled in matches.
Columns include match_id, season, start_date, venue, innings, ball, batting_team, bowling_team, striker, non_striker, bowler, runs_off_bat, extras, wides, noballs, byes, legbyes, penalty, wicket_type, player_dismissed, other_wicket_type, other_player_dismissed.

# Matches Table:

Provides metadata about each match.
Columns include season, team1, team2, date, match_number, venue, city, toss_winner, toss_decision, player_of_match, umpire1, umpire2, reserve_umpire, match_referee, winner, winner_runs, winner_wickets, match_type.

# Points Table:

Contains rankings and performance metrics of teams.
Columns include ranking, team, matches, won, lost, tie, no_results, points, net_run_rate, runs_for, overs_for, runs_against, overs_against.
Analysis and Visualizations:

# Basic Queries:

Total runs scored by each team.
Total wickets taken by each bowler.
Match outcomes (wins by batting first vs. batting second).

# Advanced Queries:

Average runs scored in powerplay overs (first 10 overs) by each team.
Fielding statistics (catches, run-outs) by each team.
Net run rate calculations.

# Complex Queries:

Highest team totals in matches.
Largest margin of victories.
Stadiums favoring batting or bowling performances.

# Data Visualization:

Utilizing Grafana for creating visual dashboards.
Charts, graphs, and tables to present trends, performance metrics, and comparisons.

# GitHub Repository:

Managing the project files, SQL queries, and documentation on GitHub.
Version control and collaboration with Git.

# Tools Used:

# Database:
MySQL 
# Query Language: 
SQL for data extraction, transformation, and aggregation.
# Visualization Tool: 
Grafana for creating interactive dashboards.
# Version Control: 
Git for managing codebase and project versions.

# Conclusion:
This project aims to leverage cricket match data to explore various aspects of the game statistically and visually. The analysis includes both basic and advanced SQL queries to derive meaningful insights that can be presented effectively using Grafana. By utilizing these tools and methodologies, the project provides a comprehensive view of cricket performance metrics and trends over time.
