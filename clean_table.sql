-- UPDATE traffic_accidents
-- SET district_id = NULL
-- WHERE district_id = 'UI';

drop table if exists clean_traffic;
CREATE TABLE clean_traffic AS 
    SELECT 
    object_id,
    incident_id,
    offense_id,
    offense_code,
    offense_code_extension,
    top_traffic_accident_offense,
    first_occurrence_date,
    reported_date,
    incident_address,
    geo_lon,
    geo_lat,

    -- district_id,
    --  | Removed district id because value is formatted weirdly
    --  | Running a SELECT DISTINCT gives duplicate of the same values,
    --  | ie. 3 or 4 rows of character 5 shows up.
    --  | Team consensus is to remove this data value altogether

    precinct_id,
    neighborhood_id,
    pedestrian_ind,
    harmful_event_seq_1,
    harmful_event_seq_2,
    harmful_event_seq_most,
    road_condition,
    light_condition,
    tu1_vehicle_type,
    tu1_travel_direction,
    tu1_vehicle_movement,
    tu1_driver_action,
    tu1_driver_humancontribfactor,
    tu1_pedestrian_action,
    tu2_vehicle_type,
    tu2_travel_direction,
    tu2_vehicle_movement,
    tu2_driver_action,
    tu2_driver_humancontribfactor,
    tu2_pedestrian_action,
    seriously_injured,
    fatalities
    FROM traffic_accidents;

ALTER TABLE f23_group20.clean_traffic OWNER TO f23_group20;