SELECT english_title, contrast AS "High Contrast"
FROM views
WHERE artist = 'Hiroshige' AND brightness > 0.5
ORDER BY contrast DESC
LIMIT 3;
