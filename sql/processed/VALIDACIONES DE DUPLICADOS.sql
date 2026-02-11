#dim_player - PK UNICA
SELECT player_id, COUNT(*) c
FROM `still-catwalk-442519-r6.nba_dwh.dim_player`
GROUP BY 1
HAVING c > 1;

-- PK duplicada
SELECT season_id, COUNT(*) c
FROM `still-catwalk-442519-r6.nba_dwh.dim_season`
GROUP BY 1
HAVING c > 1;

-- year duplicado (debe ser 0)
SELECT season_year, COUNT(*) c
FROM `still-catwalk-442519-r6.nba_dwh.dim_season`
GROUP BY 1
HAVING c > 1;

#dim_team - PK unica 
SELECT team_id, COUNT(*) c
FROM `still-catwalk-442519-r6.nba_dwh.dim_team`
GROUP BY 1
HAVING c > 1;

#dim_game - PK unica
SELECT game_id, COUNT(*) c
FROM `still-catwalk-442519-r6.nba_dwh.dim_game`
GROUP BY 1
HAVING c > 1;

#fact_player_draft_perfomance
SELECT player_id, season_id, COUNT(*) c
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance`
GROUP BY 1,2
HAVING c > 1;


