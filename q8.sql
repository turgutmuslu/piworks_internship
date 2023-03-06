UPDATE country_vaccination_stats
SET Stats_Access_Link = LOWER(TRIM(SUBSTR(Stats_Access_Link, INSTR(Stats_Access_Link, '://')+3)))
WHERE Stats_Access_Link LIKE 'http%' OR Stats_Access_Link LIKE 'https%';

UPDATE country_vaccination_stats
SET Stats_Access_Link = REGEXP_REPLACE(Stats_Access_Link, '[^a-zA-Z0-9]+', '')
WHERE Stats_Access_Link LIKE 'http%' OR Stats_Access_Link LIKE 'https%';
