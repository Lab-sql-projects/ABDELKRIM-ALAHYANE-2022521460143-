USE schemaa;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT,
    review_text TEXT,
    CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    subscription_type VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT fk_subscription_user FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

SELECT * FROM INFORMATION_SCHEMA.TABLES;
