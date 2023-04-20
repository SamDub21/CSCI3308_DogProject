CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS userProfile(
    username VARCHAR(50) PRIMARY KEY,
    bio VARCHAR(250),
    location VARCHAR(100),
    name VARCHAR(255) GENERATED ALWAYS AS (CONCAT(users.firstName, ' ', users.lastName)) STORED,
    FOREIGN KEY (username) REFERENCES users(username)
);