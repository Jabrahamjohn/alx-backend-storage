-- Create a temporary table to store the aggregated fan counts per country
SELECT origin,
       COUNT(*) AS total_fans,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM metal_bands
GROUP BY origin
ORDER BY rank;
