SET search_path = f23_group20, scastillo;

DROP TABLE IF EXISTS denver_crime CASCADE;

CREATE TABLE denver_crime (
    incident_id NUMERIC,
    offense_type_id TEXT,
    reported_date TIMESTAMP,
    nbrhd_name TEXT,
    victim_count INTEGER,
    hour INTEGER,
    day TEXT,
    month TEXT,
    year TEXT,
    total_population INTEGER,
    percent_black NUMERIC(5, 2),
    percent_white NUMERIC(5, 2),
    percent_native_american NUMERIC(5, 2),
    percent_aapi NUMERIC(5, 2),
    percent_male NUMERIC(5, 2),
    percent_under18 NUMERIC(5, 2),
    percent_65plus NUMERIC(5, 2),
    percent_in_school NUMERIC(5, 2),
    percent_only_english NUMERIC(5, 2),
    percent_spanish NUMERIC(5, 2),
    percent_housing_owner_occupied NUMERIC(5, 2),
    percent_housing_renter_occupied NUMERIC(5, 2),
    median_earn INTEGER,
    median_earn_female INTEGER,
    median_earn_male INTEGER,
    median_rent INTEGER,
    median_home_value INTEGER,
    percent_poverty NUMERIC(5, 2)
);

\COPY denver_crime FROM 'Fa23DenverCrimeData.csv' WITH CSV HEADER

ALTER TABLE denver_crime
ADD PRIMARY KEY (incident_id, offense_type_id, reported_date);

-- Add a secondary table for organization
DROP TABLE IF EXISTS denver_demographics CASCADE;
CREATE TABLE denver_demographics AS
SELECT incident_id, total_population, percent_black, percent_white, percent_native_american, percent_aapi, percent_male, percent_under18, percent_65plus, percent_in_school, percent_only_english, percent_spanish, percent_housing_owner_occupied, percent_housing_renter_occupied, median_earn, median_earn_female, median_earn_male, median_rent, median_home_value, percent_poverty
FROM denver_crime;

-- Delete the columns that were added to denver_demographics
ALTER TABLE denver_crime
DROP COLUMN total_population,
DROP COLUMN percent_black,
DROP COLUMN percent_white,
DROP COLUMN percent_native_american,
DROP COLUMN percent_aapi,
DROP COLUMN percent_male,
DROP COLUMN percent_under18,
DROP COLUMN percent_65plus,
DROP COLUMN percent_in_school,
DROP COLUMN percent_only_english,
DROP COLUMN percent_spanish,
DROP COLUMN percent_housing_owner_occupied,
DROP COLUMN percent_housing_renter_occupied,
DROP COLUMN median_earn,
DROP COLUMN median_earn_female,
DROP COLUMN median_earn_male,
DROP COLUMN median_rent,
DROP COLUMN median_home_value,
DROP COLUMN percent_poverty;

-- Relate denver_demographics to denver_crime
ALTER TABLE denver_demographics
ADD CONSTRAINT fk_denver_crime_incident_id
FOREIGN KEY (incident_id) REFERENCES denver_crime(incident_id);


ALTER TABLE f23_group20.denver_crime OWNER TO f23_group20;
ALTER TABLE f23_group20.denver_demographics OWNER TO f23_group20;




