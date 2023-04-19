const http = require('http');
const express = require('express');
const app = express();
const port = 5000;
const mysql = require('mysql2');
const path = require('path');   
const env = require('dotenv');
// const cookie_parser = require('cookie-parser');
env.config(
    {
        path: './.env'
    }
)

app.use(express.json());
// app.use(cookie_parser());

app.set('view engine','hbs');
app.use(express.urlencoded(
    {
        extended : true
    }
));

app.use('/',require('./routes/admin_routes'));
app.use('/auth',require('./routes/auth'));


app.listen(port,()=>{
    console.log('Server has started on port ' + port );
});