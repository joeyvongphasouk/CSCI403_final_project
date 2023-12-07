SET search_path = f23_group20;

-- SHARED ATTRIBUTES:
-- district_id,
-- precinct_id,
-- neighborhood_id,

-- incident_id
-- first_occurrence_date

-- joining on a table from both datasets
SELECT c.incident_id, c.victim_count, t.tu1_vehicle_type, t.tu2_vehicle_type 
FROM denver_crime_incident c
JOIN denver_traffic_incident t ON c.incident_id = t.incident_id
ORDER BY victim_count DESC;


