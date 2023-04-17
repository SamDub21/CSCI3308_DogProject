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
  res.json({status: 'success', message: 'Welcome!'});
});

/*=====Registration APIs=====*/
app.get('/register', (req, res) =>{
  res.render('pages/register');
});

app.post('/register', async (req, res) => {
  //get and validate user data
  const {username, firstName, lastName, email, password} = req.body;
  if(!username || !firstName || !lastName || !email ||!password){
    return res.status(400).json({error : 'One or more fields missing'});
  }

  //check if user alrady exists
  const checkQuery = await db.oneOrNone(`SELECT * FROM users WHERE username = $1;`, [username]);
  if(checkQuery){ //if user already in data base
    return res.status(400).json({error : 'User already exists'});
  }

  //hash the password using bcrypt library
  const hash = await bcrypt.hash(password, 10);

  //adding new user to DB
  try{
    const insertQuery = 'INSERT INTO users (username, email, firstName, lastName, password) VALUES ($1, $2, $3, $4, $5);'
    await db.none(insertQuery, [username, email, firstName, lastName, hash]);
    res.status(200).send('Registration Success!')
    // res.redirect('login');
  }catch (error){
    console.error(error);
    res.status(500).json({error : 'Server Error'});
  }
});


/*=====Login APIs=====*/
app.get('/login', (req,res) =>{
  res.render('pages/login');
});

app.post('/login', async (req, res) => {
  //get and validate user data
  const {username, password} = req.body;
  if(!username || !password){
    return res.status(400).json({error : 'One or more fields missing'});
  }

  //find given user in DB
  const query = `SELECT password FROM users where username = $1;`;
  const passwordDB = await db.oneOrNone(query, [username]);
  if(!passwordDB){ //if user not found
    res.status(404).send('User not found');
  } 
  else{
    //comparing given password and password from DB
    await bcrypt.compare(password, passwordDB.password, (err, result) =>{
      if(err){
        console.error(err);
      }
      else{
        if(!result){ //passwords dont match
          res.status(401).json({error : 'Incorrect password'});
        }
        else{
          //setting session variable
          req.session.user = username;
          req.session.save();

          res.status(200).send('Login Success!');
          // res.redirect('home');
        }
      }
    });
  }
});


/*=====Authentication Middleware=====*/
const auth = (req, res, next) => {
  if(!req.session.user){
    return res.redirect('login');
  }
  next();
};
app.use(auth);


// *****************************************************
// <!-- Section 5 : Start Server-->
// *****************************************************
// starting the server and keeping the connection open to listen for more requests
app.listen(3000);
console.log('Server is listening on port 3000');

module.exports = app;