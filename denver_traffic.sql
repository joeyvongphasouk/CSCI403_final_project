DROP TABLE IF EXISTS traffic_accidents;

CREATE TABLE traffic_accidents (
    object_id INT,
    incident_id TEXT,
    offense_id TEXT,
    offense_code TEXT,
    offense_code_extension INT,
    top_traffic_accident_offense VARCHAR(255),
    first_occurrence_date DATE,
    last_occurrence_date DATE,
    reported_date DATE,
    incident_address VARCHAR(255),
    geo_x FLOAT,
    geo_y FLOAT,
    geo_lon FLOAT,
    geo_lat FLOAT,
    district_id TEXT,
    precinct_id INT,
    neighborhood_id TEXT,
    bicycle_ind INT,
    pedestrian_ind INT,
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
    seriously_injured TEXT,
    fatalities TEXT,
    fatality_mode_1 VARCHAR(255),
    fatality_mode_2 VARCHAR(255),
    seriously_injured_mode_1 VARCHAR(255),
    seriously_injured_mode_2 VARCHAR(255),
    point_x FLOAT,
    point_y FLOAT
);

\COPY traffic_accidents FROM '/u/wy/ba/djaramillo/DBMAN_403/final_project/output.csv' DELIMITER ',' CSV HEADER;


SELECT incident_id, COUNT(*)
FROM traffic_accidents
GROUP BY incident_id
HAVING COUNT(*) > 1;