WITH least_expensive_per_hit AS (
    SELECT players.id, players.first_name, players.last_name
    FROM players
    JOIN salaries ON players.id = salaries.player_id
    JOIN performances ON players.id = performances.player_id AND salaries.year = performances.year
    WHERE salaries.year = 2001 AND performances.H > 0
    ORDER BY (salaries.salary / performances.H) ASC, players.first_name, players.last_name
    LIMIT 10
),
least_expensive_per_rbi AS (
    SELECT players.id, players.first_name, players.last_name
    FROM players
    JOIN salaries ON players.id = salaries.player_id
    JOIN performances ON players.id = performances.player_id AND salaries.year = performances.year
    WHERE salaries.year = 2001 AND performances.RBI > 0
    ORDER BY (salaries.salary / performances.RBI) ASC, players.first_name, players.last_name
    LIMIT 10
)
SELECT first_name, last_name
FROM least_expensive_per_hit
INTERSECT
SELECT first_name, last_name
FROM least_expensive_per_rbi
ORDER BY last_name, first_name;
