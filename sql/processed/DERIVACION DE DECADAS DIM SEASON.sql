SELECT
  season_id,
  season_year,
  CAST(FLOOR(season_year / 10) * 10 AS INT64) AS decade
FROM `still-catwalk-442519-r6.nba_dwh.dim_season`
ORDER BY season_year;

#Debido a las restricciones del entorno BigQuery Sandbox, no fue posible modificar el esquema de las tablas existentes. 
#Por este motivo, la variable “década” se deriva dinámicamente a partir del año de temporada (season_year) mediante consultas SQL, permitiendo el análisis temporal por décadas sin alterar la estructura original del Data Warehouse.