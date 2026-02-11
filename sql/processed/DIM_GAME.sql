CREATE OR REPLACE TABLE `still-catwalk-442519-r6.nba_dwh.dim_game` AS
SELECT DISTINCT
  game_id,
  game_date,
  season_id,
  home_team_id,
  away_team_id
FROM `still-catwalk-442519-r6.nba_raw.game`;