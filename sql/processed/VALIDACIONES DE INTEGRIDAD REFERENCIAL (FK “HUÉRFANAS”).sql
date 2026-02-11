#fact_player_draft_performance → dim_player
SELECT COUNT(*) AS missing_player_fk
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance` f
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_player` p
  ON f.player_id = p.player_id
WHERE p.player_id IS NULL;

#fact_player_draft_performance → dim_season
SELECT COUNT(*) AS missing_season_fk
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance` f
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_season` s
  ON f.season_id = s.season_id
WHERE s.season_id IS NULL;

#fact_player_draft_performance → dim_team (draft_team_id)
SELECT COUNT(*) AS missing_draft_team_fk
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance` f
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_team` t
  ON f.draft_team_id = t.team_id
WHERE f.draft_team_id IS NOT NULL
  AND t.team_id IS NULL;

#fact_team_game → dim_game
SELECT COUNT(*) AS missing_draft_team_fk
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance` f
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_team` t
  ON f.draft_team_id = t.team_id
WHERE f.draft_team_id IS NOT NULL
  AND t.team_id IS NULL;

#fact_team_game → dim_team
SELECT COUNT(*) AS missing_game_fk
FROM `still-catwalk-442519-r6.nba_dwh.fact_team_game` f
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_game` g
  ON f.game_id = g.game_id
WHERE g.game_id IS NULL;

#dim_game → dim_team (home/away)
SELECT
  SUM(CASE WHEN ht.team_id IS NULL AND g.home_team_id IS NOT NULL THEN 1 ELSE 0 END) AS missing_home_team_fk,
  SUM(CASE WHEN at.team_id IS NULL AND g.away_team_id IS NOT NULL THEN 1 ELSE 0 END) AS missing_away_team_fk
FROM `still-catwalk-442519-r6.nba_dwh.dim_game` g
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_team` ht ON g.home_team_id = ht.team_id
LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_team` at ON g.away_team_id = at.team_id;




