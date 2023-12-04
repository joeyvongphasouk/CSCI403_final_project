SET search_path = f23_group20, scastillo;

-- Seeing which incident_id elements are repeated

SELECT incident_id, COUNT(*) AS incident_count
FROM denver_demographics
GROUP BY incident_id
HAVING COUNT(*) > 1
ORDER BY incident_count DESC;


