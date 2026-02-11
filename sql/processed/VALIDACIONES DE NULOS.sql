-- DIM_PLAYER
SELECT
  SUM(CASE WHEN player_id IS NULL THEN 1 ELSE 0 END) AS null_player_id
FROM `still-catwalk-442519-r6.nba_dwh.dim_player`;

-- DIM_SEASON
SELECT
  SUM(CASE WHEN season_id IS NULL THEN 1 ELSE 0 END) AS null_season_id,
  SUM(CASE WHEN season_year IS NULL THEN 1 ELSE 0 END) AS null_season_year
FROM `still-catwalk-442519-r6.nba_dwh.dim_season`;

-- DIM_TEAM
SELECT
  SUM(CASE WHEN team_id IS NULL THEN 1 ELSE 0 END) AS null_team_id
FROM `still-catwalk-442519-r6.nba_dwh.dim_team`;

-- DIM_GAME
SELECT
  SUM(CASE WHEN game_id IS NULL THEN 1 ELSE 0 END) AS null_game_id,
  SUM(CASE WHEN season_id IS NULL THEN 1 ELSE 0 END) AS null_season_id
FROM `still-catwalk-442519-r6.nba_dwh.dim_game`;


-- FACT_PLAYER_DRAFT_PERFORMANCE
SELECT
  SUM(CASE WHEN player_id IS NULL THEN 1 ELSE 0 END) AS null_player_id,
  SUM(CASE WHEN season_id IS NULL THEN 1 ELSE 0 END) AS null_season_id,
  SUM(CASE WHEN draft_team_id IS NULL THEN 1 ELSE 0 END) AS null_draft_team_id
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance`;
