CREATE OR REPLACE TABLE `still-catwalk-442519-r6.nba_dwh.dim_season` AS
SELECT
  ROW_NUMBER() OVER (ORDER BY season_year) AS season_id,
  season_year
FROM (
  SELECT DISTINCT
    season_year
  FROM (
    SELECT DISTINCT season AS season_year
    FROM `still-catwalk-442519-r6.nba_raw.draft_history`

    UNION DISTINCT

    SELECT DISTINCT EXTRACT(YEAR FROM game_date) AS season_year
    FROM `still-catwalk-442519-r6.nba_raw.game`
  )
);

