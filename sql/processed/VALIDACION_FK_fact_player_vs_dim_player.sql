INSERT INTO still-catwalk-442519-r6.nba_dwh.dim_player (player_id)
SELECT DISTINCT f.player_id FROM still-catwalk-442519-r6.nba_dwh.fact_player_draft_performance f
LEFT JOIN still-catwalk-442519-r6.nba_dwh.dim_player p ON f.player_id = p.player_id 
WHERE f.player_id IS NOT NULL AND p.player_id IS NULL;

#Validación de integridad referencial entre fact_player_draft_performance y dim_player

#Se detectaron registros huérfanos en la relación fact–dim_player debido a jugadores presentes en datasets de draft/combine que no figuran en fuentes oficiales de NBA regular.
#Esta situación fue identificada, validada y documentada como una limitación del origen de datos