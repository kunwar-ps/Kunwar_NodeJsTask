const express = require('express');
const http = require('http');
const path = require('path');
const app = express();
const httpserver = http.createServer(app);
const bodyParser = require('body-parser');
const cors = require('cors');
const multer = require('multer');

require('./database.js');


app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(cors({origin: '*'}));

app.use('./public', express.static('public'));


app.use( '/psychiatrist/register',  require("./psychiatrist/register")  );
app.use( '/psychiatrist/register-patient' ,   require("./psychiatrist/register-patient") );
app.use( '/psychiatrist/get-token' ,  require("./psychiatrist/get-token") );
app.use( '/psychiatrist' , require("./psychiatrist/query") );

httpserver.listen(8000);