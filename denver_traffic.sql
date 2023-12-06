DROP TABLE IF EXISTS traffic_accidents;
CREATE TABLE traffic_accidents (
    object_id TEXT,
    incident_id TEXT,
    offense_id TEXT,
    offense_code TEXT,
    offense_code_extension TEXT,
    top_traffic_accident_offense VARCHAR(255),
    first_occurrence_date DATE,
    last_occurrence_date DATE,
    reported_date DATE,
    incident_address VARCHAR(255),
    geo_x TEXT,
    geo_y TEXT,
    geo_lon TEXT,
    geo_lat TEXT,
    district_id TEXT,
    precinct_id TEXT,
    neighborhood_id TEXT,
    bicycle_ind TEXT,
    pedestrian_ind TEXT,
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
    point_x TEXT,
    point_y TEXT
);


\COPY traffic_accidents FROM '/u/wy/ba/djaramillo/DBMAN_403/final_project/output.csv' DELIMITER ',' CSV HEADER;

UPDATE traffic_accidents
SET 
    top_traffic_accident_offense = LOWER(top_traffic_accident_offense),
    incident_address = LOWER(incident_address),
    district_id = LOWER(district_id),
    neighborhood_id = LOWER(neighborhood_id),
    harmful_event_seq_1 = LOWER(harmful_event_seq_1),
    harmful_event_seq_2 = LOWER(harmful_event_seq_2),
    harmful_event_seq_most = LOWER(harmful_event_seq_most),
    road_location = LOWER(road_location),
    road_description = LOWER(road_description),
    road_contour = LOWER(road_contour),
    road_condition = LOWER(road_condition),
    light_condition = LOWER(light_condition),
    tu1_vehicle_type = LOWER(tu1_vehicle_type),
    tu1_travel_direction = LOWER(tu1_travel_direction),
    tu1_vehicle_movement = LOWER(tu1_vehicle_movement),
    tu1_driver_action = LOWER(tu1_driver_action),
    tu1_driver_humancontribfactor = LOWER(tu1_driver_humancontribfactor),
    tu1_pedestrian_action = LOWER(tu1_pedestrian_action),
    tu2_vehicle_type = LOWER(tu2_vehicle_type),
    tu2_travel_direction = LOWER(tu2_travel_direction),
    tu2_vehicle_movement = LOWER(tu2_vehicle_movement),
    tu2_driver_action = LOWER(tu2_driver_action),
    tu2_driver_humancontribfactor = LOWER(tu2_driver_humancontribfactor),
    tu2_pedestrian_action = LOWER(tu2_pedestrian_action),
    fatality_mode_1 = LOWER(fatality_mode_1),
    fatality_mode_2 = LOWER(fatality_mode_2),
    seriously_injured_mode_1 = LOWER(seriously_injured_mode_1),
    seriously_injured_mode_2 = LOWER(seriously_injured_mode_2);

-- Data Cleaning
UPDATE traffic_accidents SET object_id = 'Unknown' WHERE (object_id IS NULL);
UPDATE traffic_accidents SET incident_id = 'Unknown' WHERE (incident_id IS NULL OR TRIM(incident_id) = '');
UPDATE traffic_accidents SET offense_id = 'Unknown' WHERE (offense_id IS NULL OR TRIM(offense_id) = '');
UPDATE traffic_accidents SET offense_code = 'Unknown' WHERE (offense_code IS NULL OR TRIM(offense_code) = '');
UPDATE traffic_accidents SET offense_code_extension = 'Unknown' WHERE (offense_code_extension IS NULL);
UPDATE traffic_accidents SET top_traffic_accident_offense = 'Unknown' WHERE (top_traffic_accident_offense IS NULL OR TRIM(top_traffic_accident_offense) = '');
UPDATE traffic_accidents SET incident_address = 'Unknown' WHERE (incident_address IS NULL OR TRIM(incident_address) = '');
UPDATE traffic_accidents SET geo_x = 'Unknown' WHERE (geo_x IS NULL);
UPDATE traffic_accidents SET geo_y = 'Unknown' WHERE (geo_y IS NULL);
UPDATE traffic_accidents SET geo_lon = 'Unknown' WHERE (geo_lon IS NULL);
UPDATE traffic_accidents SET geo_lat = 'Unknown' WHERE (geo_lat IS NULL);
UPDATE traffic_accidents SET district_id = 'Unknown' WHERE (district_id IS NULL OR TRIM(district_id) = '');
UPDATE traffic_accidents SET precinct_id = 'Unknown' WHERE (precinct_id IS NULL);
UPDATE traffic_accidents SET neighborhood_id = 'Unknown' WHERE (neighborhood_id IS NULL OR TRIM(neighborhood_id) = '');
UPDATE traffic_accidents SET bicycle_ind = 'Unknown' WHERE (bicycle_ind IS NULL);
UPDATE traffic_accidents SET pedestrian_ind = 'Unknown' WHERE (pedestrian_ind IS NULL);
UPDATE traffic_accidents SET harmful_event_seq_1 = 'Unknown' WHERE (harmful_event_seq_1 IS NULL OR TRIM(harmful_event_seq_1) = '');
UPDATE traffic_accidents SET harmful_event_seq_2 = 'Unknown' WHERE (harmful_event_seq_2 IS NULL OR TRIM(harmful_event_seq_2) = '');
UPDATE traffic_accidents SET harmful_event_seq_most = 'Unknown' WHERE (harmful_event_seq_most IS NULL OR TRIM(harmful_event_seq_most) = '');
UPDATE traffic_accidents SET road_location = 'Unknown' WHERE (road_location IS NULL OR TRIM(road_location) = '');
UPDATE traffic_accidents SET road_description = 'Unknown' WHERE (road_description IS NULL OR TRIM(road_description) = '');
UPDATE traffic_accidents SET road_contour = 'Unknown' WHERE (road_contour IS NULL OR TRIM(road_contour) = '');
UPDATE traffic_accidents SET road_condition = 'Unknown' WHERE (road_condition IS NULL OR TRIM(road_condition) = '');
UPDATE traffic_accidents SET light_condition = 'Unknown' WHERE (light_condition IS NULL OR TRIM(light_condition) = '');
UPDATE traffic_accidents SET tu1_vehicle_type = 'Unknown' WHERE (tu1_vehicle_type IS NULL OR TRIM(tu1_vehicle_type) = '');
UPDATE traffic_accidents SET tu1_travel_direction = 'Unknown' WHERE (tu1_travel_direction IS NULL OR TRIM(tu1_travel_direction) = '');
UPDATE traffic_accidents SET tu1_vehicle_movement = 'Unknown' WHERE (tu1_vehicle_movement IS NULL OR TRIM(tu1_vehicle_movement) = '');
UPDATE traffic_accidents SET tu1_driver_action = 'Unknown' WHERE (tu1_driver_action IS NULL OR TRIM(tu1_driver_action) = '');
UPDATE traffic_accidents SET tu1_driver_humancontribfactor = 'Unknown' WHERE (tu1_driver_humancontribfactor IS NULL OR TRIM(tu1_driver_humancontribfactor) = '');
UPDATE traffic_accidents SET tu1_pedestrian_action = 'Unknown' WHERE (tu1_pedestrian_action IS NULL OR TRIM(tu1_pedestrian_action) = '');
UPDATE traffic_accidents SET tu2_vehicle_type = 'Unknown' WHERE (tu2_vehicle_type IS NULL OR TRIM(tu2_vehicle_type) = '');
UPDATE traffic_accidents SET tu2_travel_direction = 'Unknown' WHERE (tu2_travel_direction IS NULL OR TRIM(tu2_travel_direction) = '');
UPDATE traffic_accidents SET tu2_vehicle_movement = 'Unknown' WHERE (tu2_vehicle_movement IS NULL OR TRIM(tu2_vehicle_movement) = '');
UPDATE traffic_accidents SET tu2_driver_action = 'Unknown' WHERE (tu2_driver_action IS NULL OR TRIM(tu2_driver_action) = '');
UPDATE traffic_accidents SET tu2_driver_humancontribfactor = 'Unknown' WHERE (tu2_driver_humancontribfactor IS NULL OR TRIM(tu2_driver_humancontribfactor) = '');
UPDATE traffic_accidents SET tu2_pedestrian_action = 'Unknown' WHERE (tu2_pedestrian_action IS NULL OR TRIM(tu2_pedestrian_action) = '');
UPDATE traffic_accidents SET seriously_injured = 'Unknown' WHERE (seriously_injured IS NULL OR TRIM(seriously_injured) = '');
UPDATE traffic_accidents SET fatalities = 'Unknown' WHERE (fatalities IS NULL OR TRIM(fatalities) = '');
UPDATE traffic_accidents SET fatality_mode_1 = 'Unknown' WHERE (fatality_mode_1 IS NULL OR TRIM(fatality_mode_1) = '');
UPDATE traffic_accidents SET fatality_mode_2 = 'Unknown' WHERE (fatality_mode_2 IS NULL OR TRIM(fatality_mode_2) = '');
UPDATE traffic_accidents SET seriously_injured_mode_1 = 'Unknown' WHERE (seriously_injured_mode_1 IS NULL OR TRIM(seriously_injured_mode_1) = '');
UPDATE traffic_accidents SET seriously_injured_mode_2 = 'Unknown' WHERE (seriously_injured_mode_2 IS NULL OR TRIM(seriously_injured_mode_2) = '');
UPDATE traffic_accidents SET point_x = 'Unknown' WHERE (point_x IS NULL);
UPDATE traffic_accidents SET point_y = 'Unknown' WHERE (point_y IS NULL);