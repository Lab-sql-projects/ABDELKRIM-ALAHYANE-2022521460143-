USE schemaa;

SELECT table_name 
FROM INFORMATION_SCHEMA.TABLES 
WHERE table_schema = 'schemaa';

SELECT * FROM Users;
SELECT * FROM Movies;
SELECT * FROM Reviews;
SELECT * FROM Subscriptions;
--joins
SELECT u.name, m.title, r.rating, r.review_text
FROM Reviews r
INNER JOIN Users u ON r.user_id = u.user_id
INNER JOIN Movies m ON r.movie_id = m.movie_id;
SELECT u.name, u.email, s.subscription_type, s.start_date, s.end_date
FROM Users u
LEFT JOIN Subscriptions s ON u.user_id = s.user_id;
-- update
UPDATE Subscriptions
SET subscription_type = 'Gold'
WHERE user_id = 1;
--delete
DELETE FROM Reviews
WHERE rating < 3;
-- Aggregation: Count reviews per movie with a HAVING filter
SELECT m.title, COUNT(r.review_id) AS total_reviews, AVG(r.rating) AS avg_rating
FROM Movies m
LEFT JOIN Reviews r ON m.movie_id = r.movie_id
GROUP BY m.title
HAVING AVG(r.rating) > 3;
-- Subquery
SELECT name, email
FROM Users
WHERE user_id IN (SELECT DISTINCT user_id FROM Reviews);