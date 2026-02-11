CREATE OR REPLACE TABLE `still-catwalk-442519-r6.nba_dwh.dim_team` AS
SELECT DISTINCT
  team_id,
  team_name,
  team_abbreviation,
  team_city
FROM `still-catwalk-442519-r6.nba_dwh.dim_team`;
