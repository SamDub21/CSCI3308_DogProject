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

('Oscar', '30 lbs', '3 years', 'Poodle', 'Male', 'https://i.imgur.com/BkW1wif.jpg'),
('Mia', '55 lbs', '6 years', 'Boxer', 'Female', 'https://i.imgur.com/gHKF3Kd.jpg'),
('Oliver', '20 lbs', '1 year', 'Yorkshire Terrier', 'Male', 'https://i.imgur.com/PUwxZBB.jpg'),
('Rosie', '40 lbs', '4 years', 'Cavalier King Charles Spaniel', 'Female', 'https://i.imgur.com/rMcN6bK.jpg'),
('Bandit', '65 lbs', '5 years', 'Bernese Mountain Dog', 'Male', 'https://i.imgur.com/vrH0tVu.jpg'),
('Willow', '35 lbs', '2 years', 'French Bulldog', 'Female', 'https://i.imgur.com/5NNEoqM.jpg'),
('Bear', '90 lbs', '7 years', 'Saint Bernard', 'Male', 'https://i.imgur.com/8cJoxHc.jpg'),
('Bailey', '50 lbs', '4 years', 'Labrador Retriever', 'Female', 'https://i.imgur.com/W2u4lM3.jpg'),
('Buddy', '20 lbs', '8 years', 'Chihuahua', 'Male', 'https://i.imgur.com/yGnMdGQ.jpg'),
('Lola', '45 lbs', '3 years', 'German Shepherd', 'Female', 'https://i.imgur.com/V9i0hN5.jpg'),
('Cooper', '60 lbs', '6 years', 'Golden Retriever', 'Male', 'https://i.imgur.com/v8KTdKx.jpg'),
('Lucy', '30 lbs', '4 years', 'Beagle', 'Female', 'https://i.imgur.com/ECZkV6e.jpg'),
('Rocky', '75 lbs', '5 years', 'Siberian Husky', 'Male', 'https://i.imgur.com/vbR2CgZ.jpg'),
('Daisy', '35 lbs', '2 years', 'Corgi', 'Female', 'https://i.imgur.com/HtEgI2C.jpg'),
('Charlie', '50 lbs', '7 years', 'Border Collie', 'Male', 'https://i.imgur.com/QrfrlM1.jpg'),
('Sadie', '40 lbs', '4 years', 'Australian Shepherd', 'Female', 'https://i.imgur.com/7otGg5f.jpg'),
('Max', '25 lbs', '3 years', 'Havanese', 'Male', 'https://i.imgur.com/cLR1QI5.jpg'),
('Bailey', '45 lbs', '5 years', 'Bichon Frise', 'Female', 'https://i.imgur.com/XZ8x2Rn.jpg'),
('Rocky', '60 lbs', '6 years', 'Doberman Pinscher', 'Male', 'https://i.imgur.com/yPtKLWy.jpg'),
('Stella', '35 lbs', '3 years', 'Dachshund', 'Female', 'https://i.imgur.com/gd4iK6N.jpg'),
('Gus', '50 lbs', '2 years', 'Australian Shepherd', 'Male', 'https://i.imgur.com/8qdiWXS.jpg'),
('Maggie', '55 lbs', '4 years', 'English Springer Spaniel', 'Female', 'https://i.imgur.com/QzKJ8Sd.jpg'),
('Zeus', '85 lbs', '6 years', 'Rottweiler', 'Male', 'https://i.imgur.com/Tzr27l4.jpg'),
('Roxy', '30 lbs', '3 years', 'Miniature Schnauzer', 'Female', 'https://i.imgur.com/ZhPrVJR.jpg'),
('Toby', '25 lbs', '5 years', 'Jack Russell Terrier', 'Male', 'https://i.imgur.com/mVnfQ9X.jpg'),
('Abby', '60 lbs', '6 years', 'American Pit Bull Terrier', 'Female', 'https://i.imgur.com/ZNgXTXv.jpg'),
('Diesel', '95 lbs', '4 years', 'Mastiff', 'Male', 'https://i.imgur.com/PI7kGMp.jpg'),
('Ginger', '40 lbs', '8 years', 'Shetland Sheepdog', 'Female', 'https://i.imgur.com/9JQ9P9c.jpg'),
('Apollo', '70 lbs', '3 years', 'Great Pyrenees', 'Male', 'https://i.imgur.com/l2CZ5L5.jpg'),
('Duke', '80 lbs', '5 years', 'Irish Wolfhound', 'Male', 'https://i.imgur.com/VkbKpmW.jpg'),
('Chloe', '30 lbs', '4 years', 'Pug', 'Female', 'https://i.imgur.com/QKk5gCp.jpg'),
('Bruno', '65 lbs', '7 years', 'Dalmatian', 'Male', 'https://i.imgur.com/oeG2P4B.jpg'),
('Cocoa', '50 lbs', '2 years', 'Labradoodle', 'Female', 'https://i.imgur.com/zwjBxwS.jpg'),
('Jasper', '30 lbs', '6 years', 'Shih-Poo', 'Male', 'https://i.imgur.com/qy5f4e9.jpg'),
('Nala', '55 lbs', '4 years', 'Bullmastiff', 'Female', 'https://i.imgur.com/D8Jj7Ov.jpg'),
('Simba', '40 lbs', '5 years', 'Miniature Goldendoodle', 'Male', 'https://i.imgur.com/eyitvhZ.jpg'),
('Ruby', '35 lbs', '3 years', 'Cocker Spaniel', 'Female', 'https://i.imgur.com/xuKdWy9.jpg'),
('Sampson', '75 lbs', '4 years', 'English Mastiff', 'Male', 'https://i.imgur.com/Y5TcSot.jpg'),
('Hazel', '45 lbs', '2 years', 'Australian Cattle Dog', 'Female', 'https://i.imgur.com/0vv9QLI.jpg'),
('Sam', '50 lbs', '8 years', 'English Bulldog', 'Male', 'https://i.imgur.com/fcY9gx3.jpg'),
('Max', '65 lbs', '6 years', 'Border Collie', 'Male', 'https://i.imgur.com/RDZZ2RW.jpg'),
('Bella', '25 lbs', '2 years', 'Chihuahua', 'Female', 'https://i.imgur.com/NX7Sw03.jpg'),
('Thor', '100 lbs', '5 years', 'Saint Bernard', 'Male', 'https://i.imgur.com/6SZe1X7.jpg'),
('Lucy', '40 lbs', '6 years', 'Beagle', 'Female', 'https://i.imgur.com/6gz5S9P.jpg'),
('Charlie', '55 lbs', '3 years', 'Welsh Corgi', 'Male', 'https://i.imgur.com/5wV5X5t.jpg'),
('Daisy', '35 lbs', '8 years', 'Bichon Frise', 'Female', 'https://i.imgur.com/ZhrJnDn.jpg'),
('Rocky', '75 lbs', '4 years', 'Boxer', 'Male', 'https://i.imgur.com/i3a7nMa.jpg'),
('Luna', '30 lbs', '1 year', 'Pomeranian', 'Female', 'https://i.imgur.com/G6nEJYd.jpg'),
('Zoe', '50 lbs', '7 years', 'Labrador Retriever', 'Female', 'https://i.imgur.com/Ni84PDP.jpg'),
('Milo', '20 lbs', '4 years', 'Shih Tzu', 'Male', 'https://i.imgur.com/kViayft.jpg'),
('Riley', '65 lbs', '5 years', 'Golden Retriever', 'Female', 'https://i.imgur.com/z1GcP5h.jpg'),
('Buddy', '80 lbs', '6 years', 'Great Dane', 'Male', 'https://i.imgur.com/nB7dKJz.jpg'),
('Bailey', '45 lbs', '2 years', 'Siberian Husky', 'Female', 'https://i.imgur.com/DWJX5J4.jpg'),
('Sadie', '55 lbs', '3 years', 'German Shepherd', 'Female', 'https://i.imgur.com/DFvjSvM.jpg'),
('Jack', '15 lbs', '1 year', 'Miniature Pinscher', 'Male', 'https://i.imgur.com/8ldJz5s.jpg'),
('Cooper', '70 lbs', '4 years', 'Bernese Mountain Dog', 'Male', 'https://i.imgur.com/hWXrQ3c.jpg'),
('Molly', '40 lbs', '7 years', 'Cavalier King Charles Spaniel', 'Female', 'https://i.imgur.com/N3Vj3T5.jpg'),
('Maximus', '90 lbs', '5 years', 'Doberman Pinscher', 'Male', 'https://i.imgur.com/2O1w0tm.jpg'),
('Lola', '25 lbs', '3 years', 'French Bulldog', 'Female', 'https://i.imgur.com/0ypP1RH.jpg');
