
SET search_path = f23_group20;
-- queries for finding the relation size of each table
-- this is used for calculations in the page_calculations.txt

-- denver_crime_incident
    SELECT pg_relation_size('denver_crime_incident') AS denver_crime_incident_size;
    -- text field size
    SELECT AVG(pg_column_size(incident_address)) AS average_incident_address_size
    FROM denver_crime_incident;

-- denver_crime_location
    SELECT pg_relation_size('denver_crime_location') AS denver_crime_location_size;

-- denver_crime_offense
    SELECT pg_relation_size('denver_crime_offense') AS denver_crime_offense_size;
    -- text fields size
    SELECT AVG(pg_column_size(offense_type_id)), AVG(pg_column_size(offense_category_id))
    FROM denver_crime_offense;


-- denver_traffic_inc_address
    SELECT pg_relation_size('denver_traffic_inc_address') AS denver_traffic_inc_address_size;
    -- text fields size
    SELECT AVG(pg_column_size(neighborhood_id))
    FROM denver_traffic_inc_address;
    
-- denver_traffic_incident 
    SELECT pg_relation_size('denver_traffic_incident') AS denver_traffic_incident_size;
    -- text fields size
    SELECT AVG(pg_column_size(incident_address)),
    AVG(pg_column_size(road_condition)),
    AVG(pg_column_size(light_condition)),
    AVG(pg_column_size(tu1_vehicle_type)),
    AVG(pg_column_size(tu1_travel_direction)),
    AVG(pg_column_size(tu1_vehicle_movement)),
    AVG(pg_column_size(tu1_driver_action)),
    AVG(pg_column_size(tu1_driver_humancontribfactor)),
    AVG(pg_column_size(tu1_pedestrian_action)),
    AVG(pg_column_size(tu2_vehicle_type)),
    AVG(pg_column_size(tu2_travel_direction)),
    AVG(pg_column_size(tu2_vehicle_movement)),
    AVG(pg_column_size(tu2_driver_action)),
    AVG(pg_column_size(tu2_driver_humancontribfactor)),
    AVG(pg_column_size(tu2_pedestrian_action))
    FROM denver_traffic_incident;

-- denver_traffic_offense
    SELECT pg_relation_size('denver_traffic_offense') AS denver_traffic_offense_size;
    -- text fields size
    SELECT AVG(pg_column_size(top_traffic_accident_offense)),
    AVG(pg_column_size(harmful_event_seq_1)),
    AVG(pg_column_size(harmful_event_seq_2)),
    AVG(pg_column_size(harmful_event_seq_most))
    FROM denver_traffic_offense;