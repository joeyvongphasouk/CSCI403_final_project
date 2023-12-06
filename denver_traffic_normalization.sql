SET search_path = f23_group20;

-- BEGIN;

-- create r1
DROP TABLE IF EXISTS denver_traffic_inc_address;
CREATE TABLE denver_traffic_inc_address AS
SELECT DISTINCT offense_id, incident_address, geo_lon, geo_lat, precinct_id, neighborhood_id
FROM clean_traffic;

ALTER TABLE denver_traffic_inc_address
ADD PRIMARY KEY (offense_id, incident_address);

-- create r3
DROP TABLE IF EXISTS denver_traffic_incident;
CREATE TABLE denver_traffic_incident AS
SELECT DISTINCT offense_id, incident_id, incident_address, first_occurrence_date, reported_date, road_condition, light_condition, tu1_vehicle_type, tu1_travel_direction, tu1_vehicle_movement, tu1_driver_action, tu1_driver_humancontribfactor, tu1_pedestrian_action, tu2_vehicle_type, tu2_travel_direction, tu2_vehicle_movement, tu2_driver_action, tu2_driver_humancontribfactor, tu2_pedestrian_action
FROM clean_traffic;

ALTER TABLE denver_traffic_incident
ADD PRIMARY KEY (offense_id, incident_id);

DROP TABLE IF EXISTS denver_traffic_offense;
CREATE TABLE denver_traffic_offense AS
SELECT DISTINCT object_id, offense_id, offense_code, offense_code_extension, top_traffic_accident_offense, pedestrian_ind, harmful_event_seq_1, harmful_event_seq_2, harmful_event_seq_most, seriously_injured, fatalities
FROM clean_traffic;

ALTER TABLE denver_traffic_offense
ADD PRIMARY KEY (offense_id);

DROP TABLE clean_traffic CASCADE;

ALTER TABLE f23_group20.denver_traffic_offense OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_traffic_incident OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_traffic_inc_address OWNER TO f23_group20;

-- COMMIT;