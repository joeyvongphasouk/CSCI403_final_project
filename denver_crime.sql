SET search_path = f23_group20;


DROP TABLE IF EXISTS denver_crime CASCADE;

CREATE TABLE denver_crime (
    incident_id NUMERIC,
    offense_id NUMERIC,
    offense_code NUMERIC,
    offense_code_extension NUMERIC,
    offense_type_id TEXT,
    offense_category_id TEXT,
    first_occurrence_date TIMESTAMP,
    
    -- this one is getting deleted
    last_occurrence_date TEXT,

    reported_date TIMESTAMP,
    incident_address TEXT,
    
    -- these are getting deleted
    geo_x TEXT,
    geo_y TEXT,

    geo_lon TEXT,
    geo_lat TEXT,
    district_id TEXT,
    precinct_id NUMERIC,
    neighborhood_id TEXT,

    -- these are getting deleted
    is_crime NUMERIC,
    is_traffic NUMERIC,
    
    victim_count NUMERIC
);

\COPY denver_crime FROM 'crime2021.csv' WITH CSV HEADER;

--delete appropriate columns
ALTER TABLE denver_crime
DROP COLUMN last_occurrence_date,
DROP COLUMN geo_x,
DROP COLUMN geo_y,
DROP COLUMN is_crime,
DROP COLUMN is_traffic;

-- First step, change the appropriate text columns to numeric
-- Do this by changing the empty strings to NULL values

ALTER TABLE denver_crime
ALTER COLUMN geo_lon TYPE NUMERIC USING NULLIF(geo_lon, '')::NUMERIC;

ALTER TABLE denver_crime
ALTER COLUMN geo_lat TYPE NUMERIC USING NULLIF(geo_lat, '')::NUMERIC;


ALTER TABLE f23_group20.denver_crime OWNER TO f23_group20;