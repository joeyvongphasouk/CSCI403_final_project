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
SELECT incident_id, incident_address
FROM denver_crime;

-- Create and populate denver_crime_main table
DROP TABLE IF EXISTS denver_crime_main;
CREATE TABLE denver_crime_main AS
SELECT offense_id, incident_id, first_occurrence_date, reported_date, district_id, victim_count
FROM denver_crime;

-- Create and populate denver_crime_location table
DROP TABLE IF EXISTS denver_crime_location ;
CREATE TABLE denver_crime_location AS
SELECT district_id, precinct_id, neighborhood_id, geo_lat, geo_lon
FROM denver_crime;

DROP TABLE denver_crime CASCADE;

ALTER TABLE f23_group20.denver_crime_offense OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_incident OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_main OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_crime_location OWNER TO f23_group20;

COMMIT;