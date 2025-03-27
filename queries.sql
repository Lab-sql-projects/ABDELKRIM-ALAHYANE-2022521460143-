USE schemaa;

SELECT * FROM Users;

SELECT * FROM Movies;

SELECT * FROM Reviews;

SELECT * FROM Subscriptions;

SELECT * FROM Movies WHERE genre = 'Action';

SELECT AVG(rating) FROM Reviews WHERE movie_id = 1;
