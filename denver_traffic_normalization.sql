SET search_path = f23_group20;

BEGIN;

DROP TABLE IF EXISTS denver_traffic_incident;
CREATE TABLE denver_traffic_incident AS
SELECT incident_id, incident_address, first_occurrence_date, reported_date, geo_lon, geo_lat, precinct_id, 	neighborhood_id
FROM clean_traffic;

-- repeated values
ALTER TABLE denver_traffic_incident
ADD PRIMARY KEY (incident_id);

DROP TABLE IF EXISTS denver_traffic_offense;
CREATE TABLE denver_traffic_offense AS
SELECT offense_id, incident_id, offense_code, offense_code_extension, top_traffic_accident_offense
FROM clean_traffic;

-- repeated values
ALTER TABLE denver_traffic_offense
ADD PRIMARY KEY (offense_id, incident_id);

DROP TABLE IF EXISTS denver_traffic_main;
CREATE TABLE denver_traffic_main AS
SELECT incident_id, object_id, offense_id, pedestrian_ind, tu1_vehicle_type, tu1_travel_direction, tu1_vehicle_movement, tu1_driver_action, tu1_driver_humancontribfactor, tu1_pedestrian_action, tu2_vehicle_type, tu2_travel_direction, tu2_vehicle_movement, tu2_driver_action, tu2_driver_humancontribfactor, tu2_pedestrian_action, seriously_injured, fatalities
FROM clean_traffic;

-- DROP TABLE denver_traffic CASCADE;

ALTER TABLE f23_group20.denver_traffic_offense OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_traffic_incident OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_traffic_main OWNER TO f23_group20;

COMMIT;