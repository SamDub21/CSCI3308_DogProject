CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

-- CREATE TABLE IF NOT EXISTS userProfile(
--     username VARCHAR(50) PRIMARY KEY,
--     bio VARCHAR(250),
--     location VARCHAR(100),
--     name VARCHAR(255) GENERATED ALWAYS AS (CONCAT(users.firstName, ' ', users.lastName)) STORED,
--     FOREIGN KEY (username) REFERENCES users(username)
-- );

CREATE TABLE IF NOT EXISTS products(
    imageSource VARCHAR(10000),
    title VARCHAR(1000),
    cost INT,
    description VARCHAR(10000),
    url VARCHAR(10000)
);

INSERT INTO products (imageSource, title, cost, description, url) VALUES 
('https://m.media-amazon.com/images/I/71Azp-504uL._AC_UL400_.jpg', 'Purina ONE Dry Dog Food Lamb and Rice Formula - 31.1 Lb. Bag', 46.53, 'Natural dog food with added vitamins, minerals, and nutrients has a Purina ONE SmartBlend ofhigh-quality ingredients, including quality carbohydrate sources, that helps support dog nutritional needs.', 'https://www.amazon.com/Purina-Smartblend-Natural-Formula-Adult/dp/B009IOCCD2/ref=sr_1_1_sspa?crid++++++++++++++++++++++++=2OJ905YMGZJRS&keywords=dog%2Bfood&qid=1681614881&rdc=1&sprefix=dog%2Bfood%2Caps%2C130&sr=8-1-spons&spLa++++++++++++++++++++++++=ZW5jcnlwdGVkUXVhbGlmaWVyPUFKRkEwUURLODJPRFUmZW5jcnlwdGVkSWQ9QTA1NjcyNzcyQ1lIM0NUSzIyN1NXJmVuY3J5cHRlZEFkSW++++++++++++++++++++++++Q9QTA2NzcyNDAxRkcxSjlVNk1SQ1U2JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ++++++++++++++++++++++++&th=1'),
('https://m.media-amazon.com/images/I/81YzjUFh1BS._AC_SX679_.jpg', 'Purina Pro Plan High Protein Dog Food With Probiotics for Dogs, Shredded Blend Chicken & Rice Formula - 35 lb. Bag', 66.01, 'One (1) 35 lb. Bag - Purina Pro Plan High Protein Dog Food With Probiotics for Dogs, Shredded Blend Chicken & Rice Formula', 'https://www.amazon.com/Purina-Pro-Plan-Shredded-Chicken/dp/B001QCKS4O/ref=sr_1_1_sspa?crid=1XYFT9L6J6QA8&keywords=dog%2Bfood&qid=1682378300&rdc=1&sprefix=dog%2Bfood%2Caps%2C142&sr=8-1-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyRUVRTlgxWDZaOVQ2JmVuY3J5cHRlZElkPUEwNjEyNDA3M0FPMDVQTzkyWjhTWCZlbmNyeXB0ZWRBZElkPUEwMTA4Mjk0MzcwUlZTTkdHQzBBRyZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1'),
('https://m.media-amazon.com/images/I/81TdNfI0xjL._AC_SX679_.jpg', 'IAMS Adult High Protein Large Breed Dry Dog Food with Real Chicken, 30 lb. Bag', 46.98, 'Contains (1) 30 lb. bag of IAMS Adult Large Breed Dry Dog Food Chicken', 'https://www.amazon.com/Iams-Proactive-Health-Adult-Chicken/dp/B00BD74654/ref=sr_1_4_sspa?crid=1XYFT9L6J6QA8&keywords=dog%2Bfood&qid=1682378300&sprefix=dog%2Bfood%2Caps%2C142&sr=8-4-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyRUVRTlgxWDZaOVQ2JmVuY3J5cHRlZElkPUEwNjEyNDA3M0FPMDVQTzkyWjhTWCZlbmNyeXB0ZWRBZElkPUEwMzEwNzE5M1FCNU9ESlo2TEVHTCZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1');