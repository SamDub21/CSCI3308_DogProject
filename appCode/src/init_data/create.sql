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

CREATE TABLE IF NOT EXISTS products(
    imageSource VARCHAR(10000),
    title VARCHAR(1000),
    cost INT,
    description VARCHAR(10000),
    url VARCHAR(10000)
);

CREATE TABLE IF NOT EXISTS dogs(
    name VARCHAR(40),
    weight VARCHAR(20),
    age VARCHAR(20),
    breed VARCHAR(100),
    sex VARCHAR(100),
    url VARCHAR(10000)
);

INSERT INTO products (imageSource, title, cost, description, url) VALUES 
('https://m.media-amazon.com/images/I/71Azp-504uL._AC_UL400_.jpg', 'Purina ONE Dry Dog Food Lamb and Rice Formula - 31.1 Lb. Bag', 46.53, 'Natural dog food with added vitamins, minerals, and nutrients has a Purina ONE SmartBlend ofhigh-quality ingredients, including quality carbohydrate sources, that helps support dog nutritional needs.', 'https://www.amazon.com/Purina-Smartblend-Natural-Formula-Adult/dp/B009IOCCD2/ref=sr_1_1_sspa?crid++++++++++++++++++++++++=2OJ905YMGZJRS&keywords=dog%2Bfood&qid=1681614881&rdc=1&sprefix=dog%2Bfood%2Caps%2C130&sr=8-1-spons&spLa++++++++++++++++++++++++=ZW5jcnlwdGVkUXVhbGlmaWVyPUFKRkEwUURLODJPRFUmZW5jcnlwdGVkSWQ9QTA1NjcyNzcyQ1lIM0NUSzIyN1NXJmVuY3J5cHRlZEFkSW++++++++++++++++++++++++Q9QTA2NzcyNDAxRkcxSjlVNk1SQ1U2JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ++++++++++++++++++++++++&th=1'),
('https://m.media-amazon.com/images/I/81YzjUFh1BS._AC_SX679_.jpg', 'Purina Pro Plan High Protein Dog Food With Probiotics for Dogs, Shredded Blend Chicken & Rice Formula - 35 lb. Bag', 66.01, 'One (1) 35 lb. Bag - Purina Pro Plan High Protein Dog Food With Probiotics for Dogs, Shredded Blend Chicken & Rice Formula', 'https://www.amazon.com/Purina-Pro-Plan-Shredded-Chicken/dp/B001QCKS4O/ref=sr_1_1_sspa?crid=1XYFT9L6J6QA8&keywords=dog%2Bfood&qid=1682378300&rdc=1&sprefix=dog%2Bfood%2Caps%2C142&sr=8-1-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyRUVRTlgxWDZaOVQ2JmVuY3J5cHRlZElkPUEwNjEyNDA3M0FPMDVQTzkyWjhTWCZlbmNyeXB0ZWRBZElkPUEwMTA4Mjk0MzcwUlZTTkdHQzBBRyZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1'),
('https://m.media-amazon.com/images/I/81TdNfI0xjL._AC_SX679_.jpg', 'IAMS Adult High Protein Large Breed Dry Dog Food with Real Chicken, 30 lb. Bag', 46.98, 'Contains (1) 30 lb. bag of IAMS Adult Large Breed Dry Dog Food Chicken', 'https://www.amazon.com/Iams-Proactive-Health-Adult-Chicken/dp/B00BD74654/ref=sr_1_4_sspa?crid=1XYFT9L6J6QA8&keywords=dog%2Bfood&qid=1682378300&sprefix=dog%2Bfood%2Caps%2C142&sr=8-4-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyRUVRTlgxWDZaOVQ2JmVuY3J5cHRlZElkPUEwNjEyNDA3M0FPMDVQTzkyWjhTWCZlbmNyeXB0ZWRBZElkPUEwMzEwNzE5M1FCNU9ESlo2TEVHTCZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1'),
('https://m.media-amazon.com/images/I/610MpaqesNL._AC_SX679_.jpg', 'Niche Brands Dog Chew Toy for Aggressive chewers, Real Beef Flavored Non-Toxic Rubber Indestructible Dog Toys for Medium/Large Dogs, Dental Chews for Large Dog, Real Bone Shaped Gifts for Dogs', 13.49, '[Safer/Non-Toxic] Our dog toys are made of 100% food-grade natural rubber materials, so your dog even cat can lick or bite it arbitrarily without worrying about the negative effects of swallowing.', 'https://www.amazon.com/Niche-Brands-Aggressive-Non-Toxic-Indestructible/dp/B0BRWX863D/ref=sr_1_2_sspa?crid=36V6MWKQ4798C&keywords=dog+toys&qid=1682964361&sprefix=dog+fto%2Caps%2C138&sr=8-2-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyWEZOM1Q3QzNWUEhXJmVuY3J5cHRlZElkPUEwODM0MjcyMVlHNTlKWkY3SUs4SSZlbmNyeXB0ZWRBZElkPUEwMTcxMjQwMkRQQTdBUlJZREZMRiZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU='),
('https://m.media-amazon.com/images/I/71h0a0IMnAS._AC_SX679_.jpg', 'HGB Squeaky Dog Toys, Octopus No Stuffing Crinkle Plush Dog Chew Toys for Puppy Teething, Pet Training and Entertaining, Durable Interactive Dog Toys for Puppies, Small, Medium, and Large Dogs, 2 Pack', 15.99, '[2 Pack Octopus Dog Toys] These funny octopus large dog toys with bright colors and cute looks will attract your dogs interest and keep them happy. These dog toys for large dogs are soft and lightweight, great for tug and fetch, easy for pets to carry, toss and roll around with. Its a great gift for puppies, small, medium, and large dogs', 'https://www.amazon.com/HGB-Stuffing-Teething-Entertaining-Interactive/dp/B098BB1HGN/ref=sr_1_4_sspa?crid=36V6MWKQ4798C&keywords=dog%2Btoys&qid=1682977227&sprefix=dog%2Bfto%2Caps%2C138&sr=8-4-spons&smid=A3AOV1LJEN4EKE&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyMVNROVBTWElNNFBSJmVuY3J5cHRlZElkPUEwMDg1ODc5MUNJTEMwREVBVTc4WSZlbmNyeXB0ZWRBZElkPUEwNDc2MDQzMlVLQTVURlVCU085QiZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1'),
('https://m.media-amazon.com/images/I/61oz4-uEi9L._AC_SX679_.jpg', 'Dog Toys for Aggressive Chewers,Interactive Dog Toys Tug of War, Mentally Stimulating Toys for Dogs, Puppy Teething Toys for Boredom, Dog Puzzle Treat Food Dispensing Ball Toys for Small Large Dogs', 16.99, 'HEALTHY CHEWING】Chewing is a natural behavior of dogs. We dont need to stop it, just guide it properly. ALLRIERs durable dog toy is made of TPR, nontoxic and bite resistant extremely , Ensure your dog can play and chew it safely, and easy to clean.', 'https://www.amazon.com/ALLRIER-Aggressive-Training-Teething-Dispensing/dp/B0814Y7FK8/ref=sr_1_14_sspa?crid=36V6MWKQ4798C&keywords=dog+toys&qid=1682977227&sprefix=dog+fto%2Caps%2C138&sr=8-14-spons&psc=1&smid=A2S7FE0OXGTBPE&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyMVNROVBTWElNNFBSJmVuY3J5cHRlZElkPUEwMDg1ODc5MUNJTEMwREVBVTc4WSZlbmNyeXB0ZWRBZElkPUEwNjcwMTI5MTZZRVFMSzFITDRLTSZ3aWRnZXROYW1lPXNwX210ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU='),
('https://m.media-amazon.com/images/I/714eqPn93OL._AC_SX679_.jpg', 'Dog Shampoo with Oatmeal and Aloe. Shea Butter for Smelly Dogs, Puppy Shampoo by Olivers Choice 14 oz', 13.95, 'Specifically designed to deodorize and leave your dog smelling amazing and their coat restored!', 'https://www.amazon.com/Shampoo-Oatmeal-Sensitive-Olivers-Choice/dp/B081TMYWZR/ref=sr_1_1_sspa?crid=26NBZPVEOIF8W&keywords=dog+shampoo+and+conditioner&qid=1682977827&sprefix=dog+shampoo%2Caps%2C201&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExT0NFVldBVTlWOVE5JmVuY3J5cHRlZElkPUEwNzYwMTgwNDFTVUhJUUhQMlg5JmVuY3J5cHRlZEFkSWQ9QTA2NTAwNzczMDZRRjZYRlVFS0YzJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ=='),
('https://m.media-amazon.com/images/I/51QB1mxgJEL._AC_SX679_.jpg', 'Earthbath Oatmeal & Aloe Shampoo & Conditioner Pet Grooming Set - Itchy, Dry Skin Relief, Made in USA - Vanilla & Almond, 16 oz', 25.95, 'HELPS RELIEVE ITCHING & DRY SKIN: This set includes one 16 oz shampoo and one 16 oz conditioner. Specially formulated for pets with dry, itchy, sensitive skin. Colloidal oatmeal and organic aloe vera help combat skin irritation, promote healing, and re-moisturize sensitive, dry skin.', 'https://www.amazon.com/Earthbath-Vanilla-Almond-Grooming-Bundle/dp/B0733Q6FZS/ref=sr_1_7?crid=26NBZPVEOIF8W&keywords=dog+shampoo+and+conditioner&qid=1682977914&sprefix=dog+shampoo%2Caps%2C201&sr=8-7'),
('https://m.media-amazon.com/images/I/71mntXlSfZL._AC_SX679_.jpg', 'We Love Doodles - Dog Shampoo, Conditioner, and Detangler - Best Shampoo for Goldendoodles and Doodles - Dog Shampoo for Puppies - Grooming, Organic Ingredients, Best Smelling, Made in USA (Lavender)', 15.99, '4-in-1 Dog Shampoo: Effectively cleans, conditions, detangles, and moisturizes your dogs skin. Keep your dogs fur soft, clean, and less tangled with one easy solution.', 'https://www.amazon.com/We-Love-Doodles-Conditioner-Goldendoodles/dp/B09Q837KK1/ref=sr_1_10?crid=26NBZPVEOIF8W&keywords=dog%2Bshampoo%2Band%2Bconditioner&qid=1682977914&sprefix=dog%2Bshampoo%2Caps%2C201&sr=8-10&th=1');


INSERT INTO dogs (name, weight, age, breed, sex, url) VALUES

('Oscar', '30 lbs', '3 years', 'Poodle', 'Male', 'https://images.saymedia-content.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTk2NDIwMzkxODAyNTc4MDcw/mypoodle.jpg'),
('Mia', '55 lbs', '6 years', 'Boxer', 'Female', 'https://t3.ftcdn.net/jpg/02/40/06/22/360_F_240062233_nRIi2rNFOqYOJGHCvcfDbwmfu952rfUU.jpg'),
('Oliver', '20 lbs', '1 year', 'Yorkshire Terrier', 'Male', 'https://t4.ftcdn.net/jpg/01/22/47/41/240_F_122474173_pshahnpQo3ZUQUkPvAfgmdddnhB5IHQx.jpg'),
('Rosie', '40 lbs', '4 years', 'Cavalier King Charles Spaniel', 'Female', 'https://t4.ftcdn.net/jpg/00/25/52/09/240_F_25520997_6eKTMKjwH9r4LdX83hvLfRXRX2RSo8ul.jpg'),
('Bandit', '65 lbs', '5 years', 'Bernese Mountain Dog', 'Male', 'https://t3.ftcdn.net/jpg/01/63/00/02/240_F_163000242_LYyWqbKj4twhdFUvUioupUd8zfQwUkaf.jpg'),
('Willow', '35 lbs', '2 years', 'French Bulldog', 'Female', 'https://t4.ftcdn.net/jpg/01/41/63/15/240_F_141631502_8FgYOGweNvwEwBAwNnBzZCjpV3TnnSql.jpg'),
('Bear', '90 lbs', '7 years', 'Saint Bernard', 'Male', 'https://t4.ftcdn.net/jpg/00/01/42/47/240_F_1424728_v3MTqSYIOU8BH1TiBvWlsTM6YIBvWG.jpg'),
('Bailey', '50 lbs', '4 years', 'Labrador Retriever', 'Female', 'https://t4.ftcdn.net/jpg/01/91/46/65/240_F_191466565_ZntO2DDeVT7rC0mbSML8tSHrRwfQiB58.jpg'),
('Buddy', '20 lbs', '8 years', 'Chihuahua', 'Male', 'https://t4.ftcdn.net/jpg/01/23/75/25/240_F_123752571_NUD9YtDi7AQO6KQxH92rvVf5EYzksnK5.jpg'),
('Lola', '45 lbs', '3 years', 'German Shepherd', 'Female', 'https://t3.ftcdn.net/jpg/00/46/66/14/240_F_46661408_AZB9LjlKhlsu5h6s9f5Jq5crTcW4fU4g.jpg'),
('Cooper', '60 lbs', '6 years', 'Golden Retriever', 'Male', 'https://t3.ftcdn.net/jpg/03/13/69/24/240_F_313692438_3ZCPZqlCazXoiMa8vDzqJdj39R8D5Tty.jpg'),
('Lucy', '30 lbs', '4 years', 'Beagle', 'Female', 'https://t4.ftcdn.net/jpg/01/70/83/55/240_F_170835597_8Yb74dhjvQ9XqDqDXz5LTHHwmnvjWCUU.jpg'),
('Rocky', '75 lbs', '5 years', 'Siberian Husky', 'Male', 'https://t3.ftcdn.net/jpg/01/77/68/20/240_F_177682035_u0Sb7eDy2Zpzmlhpnw781kjCFU1suY6f.jpg'),
('Daisy', '35 lbs', '2 years', 'Corgi', 'Female', 'https://t4.ftcdn.net/jpg/01/66/08/31/240_F_166083188_KxEGoCex1pfIhK98iHelxrwxLchtByJL.jpg'),
('Charlie', '50 lbs', '7 years', 'Border Collie', 'Male', 'https://t3.ftcdn.net/jpg/01/84/31/54/240_F_184315478_SrDlWTTnMBCFnqseM2E1uedTWOvJPzUh.jpg'),
('Sadie', '40 lbs', '4 years', 'Australian Shepherd', 'Female', 'https://t3.ftcdn.net/jpg/00/49/97/54/240_F_49975423_wZtOKhFHrkglcFZuxGIXVnbLr3brqbjc.jpg'),
('Max', '25 lbs', '3 years', 'Havanese', 'Male', 'https://t3.ftcdn.net/jpg/02/14/25/84/240_F_214258471_wLP7Cpr9aH96K4klpbBdDB8E6KP2ZZZM.jpg'),
('Bailey', '45 lbs', '5 years', 'Bichon Frise', 'Female', 'https://t4.ftcdn.net/jpg/00/21/76/49/240_F_21764922_LTtpscib5JCqKblxyp72q0XpqnKJbMQn.jpg'),
('Rocky', '60 lbs', '6 years', 'Doberman Pinscher', 'Male', 'https://t4.ftcdn.net/jpg/01/77/03/81/240_F_177038165_tI7d58SP1WZYwaaqUfQtLus2ppN1xRtg.jpg'),
('Stella', '35 lbs', '3 years', 'Dachshund', 'Female', 'https://t3.ftcdn.net/jpg/02/22/15/32/240_F_222153281_QGFYDh6V99PQyxaaOIf4FYLfUZK8ECfV.jpg'),
('Gus', '50 lbs', '2 years', 'Australian Shepherd', 'Male', 'https://t3.ftcdn.net/jpg/05/15/17/24/240_F_515172411_UonapqjRSHSuPzYkegEnBODvg2I1ZfCL.jpg'),
('Maggie', '55 lbs', '4 years', 'English Springer Spaniel', 'Female', 'https://t4.ftcdn.net/jpg/02/66/00/83/240_F_266008303_28OuUs2bCRvw2iM6v2AWvdd1a90agtSZ.jpg'),
('Zeus', '85 lbs', '6 years', 'Rottweiler', 'Male', 'https://t3.ftcdn.net/jpg/02/82/38/92/240_F_282389200_hfk8W2DQFwWEfyJUilqHInqqshL3caUA.jpg'),
('Roxy', '30 lbs', '3 years', 'Miniature Schnauzer', 'Female', 'https://t4.ftcdn.net/jpg/01/64/92/79/240_F_164927927_n52LBtqnvPDUN6zEJpLijFyY6pki2g0f.jpg'),
('Toby', '25 lbs', '5 years', 'Jack Russell Terrier', 'Male', 'https://t4.ftcdn.net/jpg/02/93/42/27/240_F_293422760_2fZErBT39JDYBP8xrLiRgkOP3R4tmrNf.jpg'),
('Abby', '60 lbs', '6 years', 'American Pit Bull Terrier', 'Female', 'https://t4.ftcdn.net/jpg/01/96/90/21/240_F_196902145_TWpNyJrKAyMmahytpMEmUwtMRL6Ex8mH.jpg'),
('Diesel', '95 lbs', '4 years', 'Mastiff', 'Male', 'https://t3.ftcdn.net/jpg/01/58/91/98/240_F_158919846_hcqtebtJaJ28UNeBXNxeypcCXpoWLH3s.jpg'),
('Ginger', '40 lbs', '8 years', 'Shetland Sheepdog', 'Female', 'https://t4.ftcdn.net/jpg/00/93/91/49/240_F_93914990_vFx9dCnMOHMGmOC8uY9lWrIDJawxyHpk.jpg'),
('Apollo', '70 lbs', '3 years', 'Great Pyrenees', 'Male', 'https://t4.ftcdn.net/jpg/01/92/66/61/240_F_192666144_ma7kOX5vwHQnzOd43Ebqv1SyMXmyd4mF.jpg'),
('Duke', '80 lbs', '5 years', 'Irish Wolfhound', 'Male', 'https://t4.ftcdn.net/jpg/02/33/46/63/240_F_233466387_wjnTpOlQ9sySTYQfBQPGacTPd7gmuAnh.jpg'),
('Chloe', '30 lbs', '4 years', 'Pug', 'Female', 'https://t3.ftcdn.net/jpg/00/97/88/90/240_F_97889055_un8RnohzedumipQxd08P1FDm1X3ewO1g.jpg'),
('Bruno', '65 lbs', '7 years', 'Dalmatian', 'Male', 'https://t4.ftcdn.net/jpg/02/13/84/19/240_F_213841902_XPfsdH3zcb2cqaEb8Br7rj1QqE7BbWIz.jpg'),
('Cocoa', '50 lbs', '2 years', 'Labradoodle', 'Female', 'https://t4.ftcdn.net/jpg/01/13/54/43/240_F_113544325_cYS5fYJMigX9KmcNbhM0XsJRk9Z99Slc.jpg'),
('Jasper', '30 lbs', '6 years', 'Shih-Poo', 'Male', 'https://t4.ftcdn.net/jpg/03/34/29/13/240_F_334291351_ZPQT8rlOXsd9glxNeQCeEIGnhgpRy9XO.jpg'),
('Nala', '55 lbs', '4 years', 'Bullmastiff', 'Female', 'https://t4.ftcdn.net/jpg/03/33/67/57/240_F_333675785_bZ941PiT98m7wlx6iU8w6XJx6kmdweNO.jpg'),
('Simba', '40 lbs', '5 years', 'Miniature Goldendoodle', 'Male', 'https://t4.ftcdn.net/jpg/01/78/14/83/240_F_178148396_zu5gxaisrEee8b7gR1fKBS24dzSjVIEK.jpg'),
('Ruby', '35 lbs', '3 years', 'Cocker Spaniel', 'Female', 'https://t3.ftcdn.net/jpg/00/92/41/54/240_F_92415430_yshoRbFBUyc9iI7L5iYN1I5dXQGt0GAp.jpg'),
('Sampson', '75 lbs', '4 years', 'English Mastiff', 'Male', 'https://t4.ftcdn.net/jpg/02/00/22/21/240_F_200222144_NL9UvNJv0M9OGXh9KThpVsF2TFJNkqux.jpg'),
('Hazel', '45 lbs', '2 years', 'Australian Cattle Dog', 'Female', 'https://t3.ftcdn.net/jpg/03/65/96/06/240_F_365960688_JbeG8dNTw1pSM44xsOfwOOaggRw5nZcx.jpg'),
('Sam', '50 lbs', '8 years', 'English Bulldog', 'Male', 'https://t4.ftcdn.net/jpg/00/24/70/49/240_F_24704991_VYdBJsEqTR33VBjsR1vmYy9cWLB8uwcG.jpg'),
('Max', '65 lbs', '6 years', 'Border Collie', 'Male', 'https://t3.ftcdn.net/jpg/00/88/34/58/240_F_88345863_tdpJPVC3pY1L5US7skyHJVcLuRb7LNT5.jpg'),
('Bella', '25 lbs', '2 years', 'Chihuahua', 'Female', 'https://t4.ftcdn.net/jpg/00/90/77/35/240_F_90773546_3vKe2eI1zfiytosXQE91jjstshRIwj4q.jpg'),
('Thor', '100 lbs', '5 years', 'Saint Bernard', 'Male', 'https://t4.ftcdn.net/jpg/00/08/78/43/240_F_8784311_ZrI3PKJ530vtE9CQIQc9T3FpKx0tEkre.jpg'),
('Lucy', '40 lbs', '6 years', 'Beagle', 'Female', 'https://t4.ftcdn.net/jpg/01/68/50/67/240_F_168506725_llqIyc0shNVFXKNkaMaskE4pYUwpaCaC.jpg'),
('Charlie', '55 lbs', '3 years', 'Welsh Corgi', 'Male', 'https://t4.ftcdn.net/jpg/00/22/46/69/240_F_22466984_cOGGTCCfz0Tp7oma8BvQ7ulWhfhCrJuK.jpg'),
('Daisy', '35 lbs', '8 years', 'Bichon Frise', 'Female', 'https://t3.ftcdn.net/jpg/02/21/42/62/240_F_221426287_gFS1wM2xvB8Enfq6VfAyD0cxg6xXOCuv.jpg'),
('Rocky', '75 lbs', '4 years', 'Boxer', 'Male', 'https://t3.ftcdn.net/jpg/00/75/87/78/240_F_75877846_H5Yt4Zr28j3IyWWVj8ULQpLPQee6lr9s.jpg'),
('Luna', '30 lbs', '1 year', 'Pomeranian', 'Female', 'https://t4.ftcdn.net/jpg/01/15/42/25/240_F_115422554_xm6JYj6PXbbIplilYpqzi9BSw7bCDvu1.jpg'),
('Zoe', '50 lbs', '7 years', 'Labrador Retriever', 'Female', 'https://t3.ftcdn.net/jpg/02/61/08/80/240_F_261088080_Pocz5y3jxRWX2AEsTS3sgWXcFOGfwYyB.jpg'),
('Milo', '20 lbs', '4 years', 'Shih Tzu', 'Male', 'https://t3.ftcdn.net/jpg/02/04/56/18/240_F_204561895_5fQehC3xXAiOj6Ptyl7oms1j7AEp65s2.jpg'),
('Riley', '65 lbs', '5 years', 'Golden Retriever', 'Female', 'https://t3.ftcdn.net/jpg/01/80/96/00/240_F_180960089_O2wpRB5odZlMaxJX6q5IT5vYLEy7DpAS.jpg'),
('Buddy', '80 lbs', '6 years', 'Great Dane', 'Male', 'https://t3.ftcdn.net/jpg/05/53/23/00/240_F_553230038_aEwiofPm5y5wYYW4KAPwRHLgxWx6LFjE.jpg'),
('Bailey', '45 lbs', '2 years', 'Siberian Husky', 'Female', 'https://t3.ftcdn.net/jpg/04/70/49/82/240_F_470498233_VMAANTnKWtYTyQEYIRaSGLHlJUq3M7Ar.jpg'),
('Sadie', '55 lbs', '3 years', 'German Shepherd', 'Female', 'https://t3.ftcdn.net/jpg/01/62/90/70/240_F_162907076_T0mwXz8VELdNUgT9XK9lTtpSj8bIFIZY.jpg'),
('Jack', '15 lbs', '1 year', 'Miniature Pinscher', 'Male', 'https://t4.ftcdn.net/jpg/01/65/35/03/240_F_165350346_HCo0nrlaNeWDJoXt4P6oplZM4Zu3gkUn.jpg'),
('Cooper', '70 lbs', '4 years', 'Bernese Mountain Dog', 'Male', 'https://t3.ftcdn.net/jpg/01/64/92/68/240_F_164926800_VsAZWSCCvK7PHXSnvTGZhY42qBT3BWIX.jpg'),
('Molly', '40 lbs', '7 years', 'Cavalier King Charles Spaniel', 'Female', 'https://t4.ftcdn.net/jpg/00/05/63/69/240_F_5636907_nHONgF6r3H5CznOMaQFVFR96Lm8QS6m6.jpg'),
('Maximus', '90 lbs', '5 years', 'Doberman Pinscher', 'Male', 'https://t3.ftcdn.net/jpg/01/28/63/62/240_F_128636255_UhZEu4Uy7cxyylqC5hIibedfxX5cAZmV.jpg'),
('Lola', '25 lbs', '3 years', 'French Bulldog', 'Female', 'https://t3.ftcdn.net/jpg/02/02/95/52/240_F_202955249_uumqOqyJ0uE4CZ3ldvCjuFMvlvfEhysR.jpg');
