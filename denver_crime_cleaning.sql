SET search_path = f23_group20, scastillo;

-- Seeing which incident_id elements are repeated

SELECT incident_id, COUNT(*)
FROM denver_demographics
GROUP BY incident_id
HAVING COUNT(*) > 1;