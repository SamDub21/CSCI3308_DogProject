CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) PRIMARY KEY UNIQUE ,
    password VARCHAR(60) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

-- CREATE TABLE IF NOT EXISTS articles(
--     id SERIAL PRIMARY KEY UNIQUE,
--     article_name VARCHAR(1000),
--     link VARCHAR(1000)
-- );

-- INSERT INTO articles (article_name, link) 
--     VALUES ('Adopting a Rescue Dog: The Ins and Outs and What to Expect', 'https://www.aspcapetinsurance.com/resources/ins-and-outs-of-adopting-a-dog/'),
--     ('General Dog Care','https://www.aspca.org/pet-care/dog-care/general-dog-care'),
--     ('6 Winter Safety Tips for Dogs in the Snow', 'https://www.purina.com/articles/dog/care/winter-safety-tips-for-dogs-in-snow'),
--     ('14 Tips for First-Time Dog Owners', 'https://www.dailypaws.com/dogs-puppies/dog-adoption/first-time-dog-owner-tips');