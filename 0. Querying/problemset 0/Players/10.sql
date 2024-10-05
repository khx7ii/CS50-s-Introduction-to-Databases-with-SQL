SELECT first_name, last_name, weight AS "Player Weight", birth_year
FROM players
WHERE height > 70
ORDER BY weight DESC;
