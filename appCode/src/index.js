// *****************************************************
// <!-- Section 1 : Import Dependencies -->
// *****************************************************

const express = require('express'); // To build an application server or API
const app = express();
const pgp = require('pg-promise')(); // To connect to the Postgres DB from the node server
const bodyParser = require('body-parser');
const session = require('express-session'); // To set the session object. To store or access session data, use the `req.session`, which is (generally) serialized as JSON by the store.
const bcrypt = require('bcrypt'); //  To hash passwords
const axios = require('axios'); // To make HTTP requests from our server. We'll learn more about it in Part B.
const ejs = require('ejs');

// *****************************************************
// <!-- Section 2 : Connect to DB -->
// *****************************************************

// database configuration
const dbConfig = {
  host: 'db', // the database server
  port: 5432, // the database port
  database: process.env.POSTGRES_DB, // the database name
  user: process.env.POSTGRES_USER, // the user account to connect with
  password: process.env.POSTGRES_PASSWORD, // the password of the user account
};

const db = pgp(dbConfig);

// test your database
db.connect()
  .then(obj => {
    console.log('Database connection successful'); // you can view this message in the docker compose logs
    obj.done(); // success, release the connection;
  })
  .catch(error => {
    console.log('ERROR:', error.message || error);
  });

// *****************************************************
// <!-- Section 3 : App Settings -->
// *****************************************************

app.set('view engine', 'ejs'); // set the view engine to EJS
app.use(bodyParser.json()); // specify the usage of JSON for parsing request body.
app.use('/resources/', express.static('./resources'));

app.use(express.static('resources'))

// initialize session variables
app.use(
  session({
    secret: process.env.SESSION_SECRET,
    saveUninitialized: false,
    resave: false,
  })
);

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
// *****************************************************
// <!-- Section 4 : API Routes -->
// *****************************************************

/*=====Default Route=====*/
app.get('/', (req, res) => {
  res.redirect('register');
});

//SAMPLE/TEST API
app.get('/welcome', (req, res) => {
  res.json({ status: 'success', message: 'Welcome!' });
});

/*=====Registration APIs=====*/
app.get('/register', (req, res) => {
  res.render('pages/register');
});

app.post('/register', async (req, res) => {
  //get and validate user data
  const {username, firstName, lastName, email, profileImg, password} = req.body;
  if(!username || !firstName || !lastName || !email || !profileImg || !password){
    return res.status(400).json({error : 'One or more fields missing'});
  }

  //check if user alrady exists
  const checkQuery = await db.oneOrNone(`SELECT * FROM users WHERE username = $1;`, [username]);
  if (checkQuery) { //if user already in data base
    return res.status(400).json({ error: 'User already exists' });
  }

  //hash the password using bcrypt library
  const hash = await bcrypt.hash(password, 10);
  console.log(username.length);
  console.log(firstName.length);
  console.log(lastName.length);
  console.log(email.length);
  console.log(hash.length);

  //adding new user to DB
  try{
    const insertQuery = 'INSERT INTO users (username, email, firstName, lastName, img, password) VALUES ($1, $2, $3, $4, $5, $6);'
    await db.none(insertQuery, [username, email, firstName, lastName, profileImg, hash]);
    res.status(200).redirect('login');
  }catch (error){
    console.error(error);
    res.status(500).json({ error: 'Server Error' });
  }
});


/*=====Login APIs=====*/
app.get('/login', (req, res) => {
  res.render('pages/login');
});

app.post('/login', async (req, res) => {
  //get and validate user data
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ error: 'One or more fields missing' });
  }

  //find given user in DB
  const query = `SELECT password FROM users where username = $1;`;
  const passwordDB = await db.oneOrNone(query, [username]);
  if (!passwordDB) { //if user not found
    res.status(404).send('User not found');
  }
  else {
    //comparing given password and password from DB
    await bcrypt.compare(password, passwordDB.password, (err, result) => {
      if (err) {
        console.error(err);
      }
      else {
        if (!result) { //passwords dont match
          res.status(401).json({ error: 'Incorrect password' });
        }
        else{
          //setting session variables
          const query2 = 'SELECT * FROM users where username = $1;'
          db.one(query2, [username])
          .then((data) => {
            req.session.user = username;
            req.session.firstName = data.firstname;
            req.session.lastName = data.lastname;
            req.session.email = data.email;
            req.session.profilePic = data.img;

            req.session.save();
            //send user to homepage
            res.status(200).redirect('home');
          })
          .catch((err) => {
            console.error(err);
          });
        }
      }
    });
  }
});


/*=========Get Dogs API Call=========*/

/*
var pets = {};

pets.apiKey ="live_f2votVs1YGli6OE4l6GdEUYbsBaVWEoM9FWfyGRMIV29bPaOpe1aL79BjNOh21XM";
pets.petUrl = "https://api.thedogapi.com/v1/images/search?has_breeds=true&limit=";

pets.availablePets = $('#availablePets');


 pets.form = function() {
 	$('#petForm').on('submit', function(e){
 		e.preventDefault();
 		var userLocation = $('.currentLocation').val();
     var petType = $('select#petType option:checked').val();
     console.log('click');
 		pets.petsCall(userLocation, petType, petSex);
 	});
 }
 pets.petsCall = function(userLocation, petType, petSex) {
 	console.log(userLocation, petType, petSex);
 	$.ajax({
 		url: pets.petUrl,
 		method: 'GET',
     crossDomain: true,
 		dataType: 'jsonp',
 		data : {
 			key: pets.apiKey,
 			location: userLocation,
       animal: petType,
       sex: petSex,
 			format: 'json',
 			count: 10,
 			age: 'Senior',
 			status: 'A'
 		}  
 	}).then(function(results){
   	var petResults = results.petfinder.pets.pet;
 		console.log(petResults);
 		for (var i = 0; i < petResults.length; ++i) {
     	var petName = petResults[i].name.$t;
       var petPhoto = petResults[i].media.photos.photo[0].$t;
       console.log(petName);
       console.log(petPhoto);
     	pets.availablePets.append('<p>' + petName + '</p>');
       pets.availablePets.append('<div><img src="' + petPhoto + '"></div>')
   	}
 	});
 };

// $(document).ready(function() {
// 	pets.form();
// }); */

/*app.get('/searchpage', (req, res) => {
  axios({
            url: 'https://api.thedogapi.com/v1/images/search?has_breeds=true&limit=50',
            method: 'GET',
            dataType: 'json',
            headers: {
              'Accept-Encoding': 'application/json',
            },
            params: {
              apikey: process.env.API_KEY,
              keyword: Breed,
              size: 10,
            },
          })
            .then(results => {
              console.log(results.data); // the results will be displayed on the terminal if the docker containers are running // Send some parameters
              let dogs = results.data._embedded.dogs;
              res.render('pages/searchpage.ejs',{doggys:doggys});
            })
            .catch(err => {
              // Handle errors
              console.log(err)
              res.render('pages/searchpage.ejs', {message:"Error"});
            });
      }); */

  app.get('/marketplace', (req, res) => {
    const query = `SELECT * FROM DOGS`;
    db.any(query)
      .then(data=>{
       res.render("pages/searchpage.ejs", {dogs: data})})
      });

/*=====Authentication Middleware=====*/
const auth = (req, res, next) => {
  if (!req.session.user) {
    return res.redirect('login');
  }
  next();
};
app.use(auth);

/*=====Marketplace APIS=====*/
app.get('/market', (req, res) => {
  const query = `SELECT * FROM PRODUCTS`;
  db.any(query)
  .then(data=>{
    res.render("pages/marketplace", {products: data})})
  });
  
// app.post()

/*=====Searchpage APIs=====*/
app.get('/search', (req, res) => {
  res.render('pages/searchpage');
});

/*=====Messaging Page APIs=====*/

const user_inbox_messages = `
  SELECT
      messages.username_from,
      messages.username_to,
      messages.subject,
      messages.message,
      messages.message_date,
      users.firstName,
      users.lastName
    FROM messages
      INNER JOIN users ON messages.username_from = users.username
    WHERE username_to = $1;`;

app.get("/messages_inbox", (req, res) => {

  db.any(user_inbox_messages, [req.session.user])
    .then((messages) => {
      res.locals.user = req.session.user;
      res.render("pages/messages_inbox", {
        messages
      });
    })
    .catch((err) => {
      res.render("pages/messages_inbox", {
        messages: [],
        error: true,
        message: err.message,
      });
    });
});

const user_sent_messages = `
SELECT
    messages.username_from,
    messages.username_to,
    messages.subject,
    messages.message,
    messages.message_date,
    users.firstName,
    users.lastName
  FROM messages
    INNER JOIN users ON messages.username_to = users.username
  WHERE username_from = $1;`;
  
app.get("/messages_sent", async (req, res) => {

  await db.any(user_sent_messages, [req.session.user])
    .then((messages) => {
      res.locals.user = req.session.user;
      res.render("pages/messages_sent", {
        messages
      });
    })
    .catch((err) => {
      res.render("pages/messages_sent", {
        messages: [],
        error: true,
        message: err.message,
      });
    });
});

app.get("/messages_compose", (req, res) => {
  res.render("pages/messages_compose");
});

app.post('/message_send', async (req, res) => {

  const username_from = await req.session.user;
  const username_to = await req.body.username_to;
  const subject  = await req.body.subject;
  const message = await req.body.message;
  const message_date = new Date().toISOString().slice(0, 19).replace('T', ' ');

  const query = "INSERT INTO messages (username_to, username_from, subject, message, message_date) VALUES ($1, $2, $3, $4, $5);";
  const values = [username_to, username_from, subject, message, message_date];

  // get the student_id based on the emailid
  await db.query(query, values)
    .then((data) => {

      res.redirect("/messages_compose");
    })
    .catch((err) => {
      console.log(err);
      res.redirect("/messages_compose");
    });
});

/*=====User Profile APIs=====*/
app.get('/profile', async (req,res) => {
  const username = req.session.user; //getting session user
  const fname = req.session.firstName;
  const lname = req.session.lastName;
  const addr = req.session.email;
  const profileImg = req.session.profilePic;
  res.render('pages/userProfile', {user : username, first : fname, last : lname, email : addr, img : profileImg});
});

app.get('/editProfile', async (req, res) => {
  //getting sessions vars
  const fname = req.session.firstName;
  const lname = req.session.lastName;
  const addr = req.session.email;
  const profileImg = req.session.profilePic;

  ejs.renderFile('views/pages/editUserProfile.ejs', {first : fname, last : lname, email : addr, img : profileImg}, (err, html) => {
    if (err) {
      console.error(err);
      res.status(500).send('Internal Server Error');
    } else {
      res.send(html);
    }
  });
});

app.post('/editProfile', async (req, res) => {
  //validating given info
  const{firstName, lastName, email, profileImg} = req.body
  if(!firstName || !lastName|| !email|| !profileImg){
    return res.status(400).json({error : 'One or more fields missing'});
  }
  //updating DB
  const query = `UPDATE users SET firstname = $1, lastname = $2, email = $3, img = $4 WHERE username = $5;`
  const user = req.session.user;
  await db.query(query, [firstName, lastName, email, profileImg, user])
  .then((data) => {
    //updating session vars
    req.session.firstName = firstName;
    req.session.lastName = lastName;
    req.session.email = email;
    req.session.profilePic = profileImg;
    req.session.save();

    res.render('pages/userProfile', {user : user, first : firstName, last : lastName, email : email, img : profileImg});
  }).catch((err) => {
    console.error(err);
    res.status(500).json({error : 'Server Error'});
  });
});

/*=====Home Page APIs=====*/
app.get('/home', (req, res) => {
  res.render('pages/home');
});

/*=====Logout API=====*/
app.get("/logout", (req, res) => {
  req.session.destroy();
  res.status(200).redirect('login');
});
// *****************************************************
// <!-- Section 5 : Start Server-->
// *****************************************************
// starting the server and keeping the connection open to listen for more requests
app.listen(3000);
console.log('Server is listening on port 3000');

module.exports = app;