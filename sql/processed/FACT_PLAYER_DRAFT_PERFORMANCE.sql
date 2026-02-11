CREATE OR REPLACE TABLE `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance` AS

WITH draft_history_dedup AS (
  SELECT
    person_id,
    season AS season_year,
    team_id AS draft_team_id,
    overall_pick,
    round_number,
    round_pick,
    draft_type,
    organization,
    organization_type,
    ROW_NUMBER() OVER (
      PARTITION BY person_id, season
      ORDER BY overall_pick ASC
    ) AS rn
  FROM `still-catwalk-442519-r6.nba_raw.draft_history`
),
draft_history_clean AS (
  SELECT *
  FROM draft_history_dedup
  WHERE rn = 1
)

SELECT
  dh.person_id AS player_id,
  ds.season_id,
  dh.draft_team_id,
  dh.overall_pick,
  dh.round_number,
  dh.round_pick,
  dh.draft_type,
  dh.organization,
  dh.organization_type,
  dcs.height_wo_shoes,
  dcs.height_w_shoes,
  dcs.weight,
  dcs.wingspan,
  dcs.standing_reach,
  dcs.body_fat_pct,
  dcs.hand_length,
  dcs.hand_width,
  dcs.bench_press,
  dcs.lane_agility_time,
  dcs.modified_lane_agility_time,
  dcs.three_quarter_sprint,
  dcs.standing_vertical_leap,
  dcs.max_vertical_leap

FROM draft_history_clean dh

LEFT JOIN `still-catwalk-442519-r6.nba_dwh.dim_season` ds
  ON dh.season_year = ds.season_year

LEFT JOIN `still-catwalk-442519-r6.nba_raw.draft_combine_stats` dcs
  ON dh.person_id = dcs.player_id
 AND dh.season_year = dcs.season;


