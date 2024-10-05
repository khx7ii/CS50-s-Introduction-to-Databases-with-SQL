SELECT d.name AS district_name, AVG(g.graduated) AS avg_graduation_rate
FROM districts d
JOIN schools s ON d.id = s.district_id
JOIN graduation_rates g ON s.id = g.school_id
GROUP BY d.name
HAVING AVG(g.graduated) > (
    SELECT AVG(graduated)
    FROM graduation_rates
);
