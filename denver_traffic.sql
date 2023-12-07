SET search_path = f23_group20;
BEGIN;

DROP TABLE IF EXISTS traffic_accidents;
CREATE TABLE traffic_accidents (
    shape TEXT,
    object_id BIGINT,
    incident_id BIGINT,
    offense_id BIGINT,
    offense_code INTEGER,
    offense_code_extension SMALLINT,
    top_traffic_accident_offense TEXT,
    first_occurrence_date TIMESTAMP,
    last_occurrence_date TIMESTAMP,
    reported_date TIMESTAMP,
    incident_address TEXT,
    geo_x INTEGER,
    geo_y INTEGER,
    geo_lon FLOAT,
    geo_lat FLOAT,
    district_id TEXT,
    precinct_id SMALLINT,
    neighborhood_id TEXT,
    bicycle_ind SMALLINT,
    pedestrian_ind SMALLINT,
    harmful_event_seq_1 TEXT,
    harmful_event_seq_2 TEXT,
    harmful_event_seq_most TEXT,
    road_location TEXT,
    road_description TEXT,
    road_contour TEXT,
    road_condition TEXT,
    light_condition TEXT,
    tu1_vehicle_type TEXT,
    tu1_travel_direction TEXT,
    tu1_vehicle_movement TEXT,
    tu1_driver_action TEXT,
    tu1_driver_humancontribfactor TEXT,
    tu1_pedestrian_action TEXT,
    tu2_vehicle_type TEXT,
    tu2_travel_direction TEXT,
    tu2_vehicle_movement TEXT,
    tu2_driver_action TEXT,
    tu2_driver_humancontribfactor TEXT,
    tu2_pedestrian_action TEXT,
    seriously_injured SMALLINT,
    fatalities SMALLINT,
    fatality_mode_1 TEXT,
    fatality_mode_2 TEXT,
    seriously_injured_mode_1 TEXT,
    seriously_injured_mode_2 TEXT,
    point_x TEXT,
    point_y TEXT
);


\COPY traffic_accidents FROM './traffic_accidents.csv' DELIMITER ',' CSV HEADER;
ALTER TABLE f23_group20.traffic_accidents OWNER TO f23_group20;

COMMIT;