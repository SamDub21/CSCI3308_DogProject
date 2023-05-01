CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY UNIQUE ,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50),
    img TEXT

);

CREATE TABLE IF NOT EXISTS messages(
    username_to VARCHAR(50),
    username_from VARCHAR(50),
    subject VARCHAR(100),
    message VARCHAR(500),
    message_date TIMESTAMP,
    FOREIGN KEY (username_from) REFERENCES users(username)
);

