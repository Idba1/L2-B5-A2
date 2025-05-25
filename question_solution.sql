-- problem-1
INSERT INTO rangers (name, region) VALUES 
('Derek Fox', 'Coastal Plains');


-- problem-2
SELECT COUNT(DISTINCT species_id) AS unique_species_count 
FROM sightings;


-- problem-3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';


--problem-4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.ranger_id, r.name
ORDER BY r.name ASC;


-- problem-5
SELECT common_name 
FROM species
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings);


-- problem-6
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;


--problem-7
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;


--problem-8
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;


-- problem-9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);

