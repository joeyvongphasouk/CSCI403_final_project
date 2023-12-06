SET search_path = f23_group20;

BEGIN;

-- Create and populate denver_crime_offense table
DROP TABLE IF EXISTS denver_crime_offense;
CREATE TABLE denver_crime_offense AS
SELECT offense_id, offense_code, offense_code_extension, offense_type_id, offense_category_id
FROM denver_crime;

-- Create and populate denver_crime_main table
DROP TABLE IF EXISTS denver_crime_main;
CREATE TABLE denver_crime_main AS
SELECT offense_id, incident_id, incident_address, first_occurrence_date, reported_date, district_id, victim_count
FROM denver_crime;

-- Create and populate denver_crime_location table
DROP TABLE IF EXISTS denver_crime_location ;
CREATE TABLE denver_crime_location AS
SELECT district_id, precinct_id, neighborhood_id, geo_lat, geo_lon
FROM denver_crime;

DROP TABLE denver_crime CASCADE;

-- Add primary key for denver_crime_offense table
ALTER TABLE denver_crime_offense
ADD PRIMARY KEY (offense_id);

-- Add composite primary key for denver_crime_main table
ALTER TABLE denver_crime_main
ADD PRIMARY KEY (offense_id, incident_id);

-- Add composite primary key for denver_crime_location table
ALTER TABLE denver_crime_location
ADD PRIMARY KEY (district_id, geo_lat, geo_lon);

-- Add foreign key references in denver_crime_main table
ALTER TABLE denver_crime_main
ADD FOREIGN KEY (offense_id) REFERENCES denver_crime_offense(offense_id);

-- Add foreign key references in denver_crime_location table
ALTER TABLE denver_crime_location
ADD FOREIGN KEY (district_id) REFERENCES denver_crime_main(district_id);

ALTER TABLE denver_crime_location
ADD FOREIGN KEY (precinct_id) REFERENCES denver_crime_main(precinct_id);

ALTER TABLE denver_crime_location
ADD FOREIGN KEY (neighborhood_id) REFERENCES denver_crime_main(neighborhood_id);


ALTER TABLE f23_group20.denver_crime_offense OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_main OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_location OWNER TO f23_group20;

COMMIT;