-- Import the table dump
-- Assuming the table dump file is names.sql
-- Replace 'path/to/names.sql' with the actual path to the names.sql file
SOURCE path/to/names.sql;

-- Create the index
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), LEFT(score, 1));