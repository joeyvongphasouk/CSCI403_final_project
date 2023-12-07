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
    top_traffic_accident_offense VARCHAR(255),
    first_occurrence_date DATE,
    last_occurrence_date DATE,
    reported_date DATE,
    incident_address VARCHAR(255),
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
    road_location VARCHAR(255),
    road_description VARCHAR(255),
    road_contour VARCHAR(255),
    road_condition VARCHAR(255),
    light_condition VARCHAR(255),
    tu1_vehicle_type VARCHAR(255),
    tu1_travel_direction VARCHAR(255),
    tu1_vehicle_movement VARCHAR(255),
    tu1_driver_action VARCHAR(255),
    tu1_driver_humancontribfactor VARCHAR(255),
    tu1_pedestrian_action VARCHAR(255),
    tu2_vehicle_type VARCHAR(255),
    tu2_travel_direction VARCHAR(255),
    tu2_vehicle_movement VARCHAR(255),
    tu2_driver_action VARCHAR(255),
    tu2_driver_humancontribfactor VARCHAR(255),
    tu2_pedestrian_action VARCHAR(255),
    seriously_injured SMALLINT,
    fatalities SMALLINT,
    fatality_mode_1 VARCHAR(255),
    fatality_mode_2 VARCHAR(255),
    seriously_injured_mode_1 VARCHAR(255),
    seriously_injured_mode_2 VARCHAR(255),
    point_x TEXT,
    point_y TEXT
);


\COPY traffic_accidents FROM './traffic_accidents.csv' DELIMITER ',' CSV HEADER;
ALTER TABLE f23_group20.traffic_accidents OWNER TO f23_group20;

COMMIT;