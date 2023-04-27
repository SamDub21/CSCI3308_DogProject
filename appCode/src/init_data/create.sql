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

CREATE TABLE IF NOT EXISTS messages(
    username_to VARCHAR(50),
    username_from VARCHAR(50),
    subject VARCHAR(100),
    message VARCHAR(500),
    message_date TIMESTAMP,
    FOREIGN KEY (username_from) REFERENCES users(username)
);

-- Dummy message data for testing
INSERT INTO users (username, password, firstName, lastName, email) VALUES
    ('angu8719', '$2b$10$mrvBFCtjnry9/RKk/qiAje52/jylC8IpZzHAZ5iVMWKIaUp9oesoq', 'Andrew', 'Gusty', 'angu8719@colorado.edu');

INSERT INTO messages (username_to, username_from, subject, message, message_date) VALUES
    ('angu8719', 'angu8719', 'Hello', 'Hi', '2016-06-22 19:10:25-07'),
    ('angu8719', 'angu8719', 'Goodbye', 'Bye', '2023-06-22 19:10:25-07');