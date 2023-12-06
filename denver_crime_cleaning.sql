SET search_path = f23_group20;

-- Seeing which incident_id elements are repeated

SELECT incident_id, COUNT(*) AS incident_count
FROM denver_crime
GROUP BY incident_id
HAVING COUNT(*) > 1
ORDER BY incident_count DESC;

-- there are a couple of incident_id elements that are repeated at most
-- 6 times, this will need to be adressed in normalization

-- Seeing which 



