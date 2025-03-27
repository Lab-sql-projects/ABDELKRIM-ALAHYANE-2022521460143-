USE schemaa;

INSERT INTO Users (name, email, password) 
VALUES ('John Doe', 'john.doe@example.com', 'password123');

INSERT INTO Movies (title, genre) 
VALUES ('Inception', 'Action');

INSERT INTO Reviews (movie_id, user_id, rating, review_text) 
VALUES (1, 1, 5, 'Amazing movie!');

INSERT INTO Subscriptions (user_id, subscription_type, start_date, end_date) 
VALUES (1, 'Premium', '2025-03-01', '2025-03-31');
