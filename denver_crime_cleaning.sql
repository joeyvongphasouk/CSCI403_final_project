SET search_path = f23_group20;

-- Determining best attributes to use as a key

-- Seeing which incident_id elements are repeated
SELECT incident_id, COUNT(*) AS incident_count
FROM denver_crime
GROUP BY incident_id
HAVING COUNT(*) > 1
ORDER BY incident_count DESC;

-- RESULTS
-- there are a couple of incident_id elements that are repeated at most
-- 6 times, this will need to be adressed in normalization


-- Seeing which offense_id elements are repeated
SELECT offense_id, COUNT(*) AS offense_count
FROM denver_crime
GROUP BY offense_id
HAVING COUNT(*) > 1
ORDER BY offense_count DESC;

-- RESULTS
-- no repeated elements, could use this as a primary key

-- Seeing which offense_code elements are repeated
SELECT offense_code, COUNT(*) AS offense_code_count
FROM denver_crime
GROUP BY offense_code
HAVING COUNT(*) > 1
ORDER BY offense_code_count DESC;

-- RESULTS
-- many repeated values for a code (in the thousands)
-- this can be used in the ui for outputting a table from a user-provided offense code
-- prob not a good idea for a key

-- CONCLUSION - key = (offense_id, incident_id) - use when doing functional dependencies



