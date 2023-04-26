CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY UNIQUE ,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);
