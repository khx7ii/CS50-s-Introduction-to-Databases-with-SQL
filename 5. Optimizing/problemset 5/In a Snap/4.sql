SELECT u.username
FROM users u
JOIN (
    SELECT to_user_id, COUNT(*) as message_count
    FROM messages
    GROUP BY to_user_id
    ORDER BY message_count DESC
    LIMIT 1
) AS popular ON u.id = popular.to_user_id;
