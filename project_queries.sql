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


----------- Actual queries
-- 1 What neighborhoods have more incidents of crime
--   than the average?
WITH NeighborhoodCrimeCounts AS (
    SELECT dl.neighborhood_id, COUNT(di.incident_id) AS incident_count
    FROM f23_group20.denver_crime_location dl
    JOIN f23_group20.denver_crime_incident di ON dl.offense_id = di.offense_id
    GROUP BY dl.neighborhood_id
)
SELECT ncc.neighborhood_id, ncc.incident_count
FROM NeighborhoodCrimeCounts ncc
WHERE ncc.incident_count > (
    SELECT AVG(incident_count) FROM NeighborhoodCrimeCounts
)
ORDER BY ncc.incident_count DESC;

-- 2 What are the most common road conditions associated with
--   traffic accidents?
SELECT road_condition, condition_count
FROM (
    SELECT road_condition, COUNT(*) as condition_count
    FROM traffic_accidents
    GROUP BY road_condition
    ORDER BY condition_count DESC
    LIMIT 1
) AS MostCommonCondition;

-- 3 What vehicle types are involved in the highest
--   victim count accidents?
SELECT c.incident_id, c.victim_count, t.tu1_vehicle_type, t.tu2_vehicle_type 
FROM denver_crime_incident c
JOIN denver_traffic_incident t ON c.incident_id = t.incident_id
ORDER BY victim_count DESC;

-- 4 

\COPY (
SELECT
    t.neighborhood_id,
    COUNT(DISTINCT t.offense_id) AS traffic_accident_count,
    COUNT(DISTINCT c.offense_id) AS crime_incident_count,
    COUNT(DISTINCT c.offense_id) * 1.0 / COUNT(DISTINCT t.offense_id) AS ratio
FROM denver_traffic_inc_address t
JOIN denver_crime_location c ON t.neighborhood_id = c.neighborhood_id
GROUP BY t.neighborhood_id
ORDER BY t.neighborhood_id
) TO 'ratios.csv' WITH CSV HEADER;