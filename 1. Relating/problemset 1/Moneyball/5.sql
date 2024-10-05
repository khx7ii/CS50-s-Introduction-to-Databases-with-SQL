SELECT DISTINCT teams.name
FROM players
JOIN performances ON players.id = performances.player_id
JOIN teams ON performances.team_id = teams.id
WHERE first_name = 'Satchel' AND last_name = 'Paige';
