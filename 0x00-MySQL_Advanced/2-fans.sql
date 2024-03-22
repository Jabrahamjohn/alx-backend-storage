-- Create a temporary table to store the aggregated fan counts per country
-- Create a temporary table to store the rankings
CREATE TEMPORARY TABLE temp_rankings AS
SELECT origin, COUNT(*) AS nb_fans
FROM metal_bands
GROUP BY origin;

-- Rank the origins based on the number of fans
SELECT origin, nb_fans,
       RANK() OVER (ORDER BY nb_fans DESC) AS country_rank
FROM temp_rankings
ORDER BY country_rank;
