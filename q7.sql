UPDATE country_vaccination_stats
SET daily_vaccinations = COALESCE(medians.median_daily_vaccinations, 0)
FROM (
    SELECT country, MEDIAN(daily_vaccinations) AS median_daily_vaccinations
    FROM country_vaccination_stats
    WHERE daily_vaccinations IS NOT NULL
    GROUP BY country
) medians
WHERE country_vaccination_stats.country = medians.country
AND country_vaccination_stats.daily_vaccinations IS NULL;