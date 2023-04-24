CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY UNIQUE ,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS userProfile(
    username VARCHAR(50) UNIQUE,
    bio VARCHAR(250),
    zipcode VARCHAR(100),
    name VARCHAR(50),
    FOREIGN KEY (username) REFERENCES users(username)
);