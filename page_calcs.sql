
SET search_path = f23_group20;
-- queries for finding the relation size of each table
-- this is used for calculations in the page_calculations.txt
SELECT pg_relation_size('denver_crime_incident') AS denver_crime_incident_size;
SELECT pg_relation_size('denver_crime_location') AS denver_crime_location_size;
SELECT pg_relation_size('denver_crime_offense') AS denver_crime_offense_size;

SELECT pg_relation_size('denver_traffic_inc_address') AS denver_traffic_inc_address_size;
SELECT pg_relation_size('denver_traffic_incident') AS denver_traffic_incident_size;
SELECT pg_relation_size('denver_traffic_offense') AS denver_traffic_offense_size;