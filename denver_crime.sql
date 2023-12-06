SET search_path = f23_group20;


DROP TABLE IF EXISTS denver_crime CASCADE;

CREATE TABLE denver_crime (
    incident_id NUMERIC,
    offense_id NUMERIC,
    offense_code NUMERIC,
    offense_code_extension NUMERIC,
    offense_type_id TEXT,
    offense_category_id TEXT,
    first_occurrence_date TIMESTAMP,
    last_occurrence_date TEXT,
    reported_date TIMESTAMP,
    incident_address TEXT,
    geo_x TEXT,
    geo_y TEXT,
    geo_lon NUMERIC,
    geo_lat NUMERIC,
    district_id TEXT,
    precinct_id NUMERIC,
    neighborhood_id TEXT,
    is_crime NUMERIC,
    is_traffic NUMERIC,
    victim_count NUMERIC
);

\COPY denver_crime FROM 'crime2021.csv' WITH CSV HEADER;