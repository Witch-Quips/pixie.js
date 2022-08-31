const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();
const path = require('path');

// Built in middleware
app.use(express.json());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// App routes

app.use('/api/v1/users', require('./controllers/users'));
app.use('/api/v1/cards', require('./controllers/cards'));

app.use('/api/v1/meanings', require('./controllers/meanings'));

app.use('/api/v1/authors', require('./controllers/authors'));
app.use('/api/v1/pamelas', require('./controllers/pamelas'));


// Error handling & 404 middleware for when
// a request doesn't match any app routes
app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;
