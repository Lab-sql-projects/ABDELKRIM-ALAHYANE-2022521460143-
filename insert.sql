USE schemaa;

INSERT INTO Users (name, email, password) 
VALUES 
('Kennedy Ryan', 'kennedyryan@example.com', 'password1234'),
('Salim', 'salim@example.com', 'password12345');
INSERT INTO Movies (title, genre) 
VALUES 
('Shutter Island', 'Drama'),
('Martyrs', 'Horror');
INSERT INTO Reviews (movie_id, user_id, rating, review_text) 
VALUES 
(2, 5, 5, 'Amazing movie!'),
(3, 6, 5, 'Amazing movie!');
INSERT INTO Subscriptions (user_id, subscription_type, start_date, end_date)
VALUES  
(5, 'Premium', '2025-04-01', '2025-04-30'),
(6, 'Premium', '2024-03-01', '2024-03-31');