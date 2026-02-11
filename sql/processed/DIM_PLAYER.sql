CREATE OR REPLACE TABLE `project.nba_dwh.dim_player` AS
SELECT DISTINCT
  player_id,
  full_name,
  first_name,
  last_name,
  birthdate,
  country,
  position,
  height,
  weight,
  season_exp
FROM `project.nba_raw.common_player_info`;
