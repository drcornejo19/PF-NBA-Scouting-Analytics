SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN overall_pick IS NULL THEN 1 ELSE 0 END) AS null_overall_pick,
  SUM(CASE WHEN height_w_shoes IS NULL THEN 1 ELSE 0 END) AS null_height_w_shoes,
  SUM(CASE WHEN wingspan IS NULL THEN 1 ELSE 0 END) AS null_wingspan,
  SUM(CASE WHEN lane_agility_time IS NULL THEN 1 ELSE 0 END) AS null_lane_agility_time,
  SUM(CASE WHEN max_vertical_leap IS NULL THEN 1 ELSE 0 END) AS null_max_vertical_leap
FROM `still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance`;

#Se realizó una validación de valores nulos sobre atributos físicos provenientes del NBA Draft Combine.
#Se detectó una alta proporción de valores nulos en métricas como wingspan, vertical leap y lane agility, lo cual es esperable ya que no todos los jugadores participan del combine o realizan todas las pruebas.
#No se detectaron valores nulos en atributos críticos como overall_pick, garantizando la integridad del análisis