CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY UNIQUE ,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

-- CREATE TABLE IF NOT EXISTS profileImages(
--     username VARCHAR(50),
--     image_data BLOB,
--     FOREIGN KEY (username) REFERENCES users(username)
-- );