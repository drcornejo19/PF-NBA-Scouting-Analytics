SELECT 'dim_game' AS table_name, COUNT(*) AS row_count
FROM `still-catwalk-442519-r6.nba_dwh.dim_game`
UNION ALL
SELECT 'dim_player', COUNT(*)
FROM `still-catwalk-442519-r6.nba_dwh.dim_player`
UNION ALL
SELECT 'dim_season', COUNT(*)
FROM `still-catwalk-442519-r6.nba_dwh.dim_season`
UNION ALL
SELECT 'dim_team', COUNT(*)
FROM `still-catwalk-442519-r6.nba_dwh.dim_team`
UNION ALL
SELECT 'fact_player_draft_performance', COUNT(*)
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance`;

