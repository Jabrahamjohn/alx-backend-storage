-- Create a temporary table to store the computed lifespan
CREATE TEMPORARY TABLE temp_bands (
    band_name VARCHAR(255),
    lifespan INT
);

-- Insert data into the temporary table by computing the lifespan
INSERT INTO temp_bands (band_name, lifespan)
SELECT band_name, 
       (YEAR('2022-01-01') - CAST(SUBSTRING_INDEX(lifespan, '-', 1) AS UNSIGNED)) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%';

-- Retrieve the bands ranked by their longevity
SELECT band_name, lifespan
FROM temp_bands
ORDER BY lifespan DESC;