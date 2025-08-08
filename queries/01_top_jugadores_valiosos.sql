-- OBJETIVO 1: Top 10 jugadores más valiosos por año (2009–2024)
-- Habilidades: CTE, RANK(), filtrado por rango de años
-- 1) Corrección de nombres:
--    - Algunos registros en la tabla 'players' tienen todo el nombre
--      en 'last_name' o en 'first_name'.
--    - Se crea 'full_name' combinando ambos campos y aplicando INITCAP
--      para estandarizar mayúsculas/minúsculas.
-- 
-- 2) Ranking con empates:
--    - Se usa RANK() en lugar de ROW_NUMBER() para que, si dos jugadores
--      tienen el mismo valor máximo, compartan el mismo puesto.
--    - Ejemplo: dos jugadores con el valor más alto reciben posición 1,
--      y el siguiente pasa a posición 3.
--    - Esto refleja fielmente los empates de mercado sin forzar un orden
--      arbitrario.
--
-- 3) Rango de años:
--    - Se filtran los años 2009 a 2024 porque:
--      a) Entre 2001 y 2008 la muestra de jugadores es reducida y poco representativa.
--      b) En 2025 los datos no están completos, lo que podría sesgar los resultados.
--      c) El rango 2009–2024 concentra la mayor cantidad y calidad de registros.


WITH player_yearly_max AS (
    SELECT 
        pv.player_id,
        CONCAT(p.first_name, ' ', p.last_name) AS jugador,
        EXTRACT(YEAR FROM pv.date::date) AS anio,
        MAX(pv.market_value_in_eur) AS valor_maximo
    FROM player_valuations pv
    JOIN players p 
        ON p.player_id = pv.player_id
    WHERE pv.market_value_in_eur > 0
      AND EXTRACT(YEAR FROM pv.date::date) BETWEEN 2009 AND 2024
    GROUP BY pv.player_id, jugador, anio
),
ranked_players AS (
    SELECT *,
           RANK() OVER (PARTITION BY anio ORDER BY valor_maximo DESC) AS ranking
    FROM player_yearly_max
)
SELECT *
FROM ranked_players
WHERE ranking <= 10
ORDER BY anio desc, ranking
