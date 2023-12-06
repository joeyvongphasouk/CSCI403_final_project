SET search_path = f23_group20;

BEGIN;

-- Create and populate denver_crime_offense table
DROP TABLE IF EXISTS denver_crime_offense;
CREATE TABLE denver_crime_offense AS
SELECT offense_id, offense_code, offense_code_extension, offense_type_id, offense_category_id
FROM denver_crime;

-- Create and populate denver_crime_incident table
DROP TABLE IF EXISTS denver_crime_incident;
CREATE TABLE denver_crime_incident AS
SELECT offense_id, incident_id, incident_address, victim_count
FROM denver_crime;

-- Create and populate denver_crime_location table
DROP TABLE IF EXISTS denver_crime_location ;
CREATE TABLE denver_crime_location AS
SELECT offense_id, district_id, precinct_id, neighborhood_id, geo_lat, geo_lon
FROM denver_crime;

DROP TABLE denver_crime CASCADE;

-- Add primary keys 
ALTER TABLE denver_crime_offense
ADD PRIMARY KEY (offense_id);

ALTER TABLE denver_crime_incident
ADD PRIMARY KEY (offense_id, incident_id);

ALTER TABLE denver_crime_location
ADD PRIMARY KEY (offense_id, district_id);

-- Adding foreign keys
-- Add foreign keys to denver_crime_incident table referencing denver_crime_offense table
ALTER TABLE denver_crime_incident
ADD CONSTRAINT fk_offense_id
FOREIGN KEY (offense_id)
REFERENCES denver_crime_offense(offense_id);

-- Add foreign keys to denver_crime_location table referencing denver_crime_offense table
ALTER TABLE denver_crime_location
ADD CONSTRAINT fk_offense_id_loc
FOREIGN KEY (offense_id)
REFERENCES denver_crime_offense(offense_id);


ALTER TABLE f23_group20.denver_crime_offense OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_incident OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_location OWNER TO f23_group20;

COMMIT;