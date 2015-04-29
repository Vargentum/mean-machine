var express = require('express');
var app = express();
var path = require('path');

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'))
});

app.listen(1337);
console.log('1337 is the magic port');


var adminRouter = express.Router();

adminRouter.use(function(req, res, next) {
  console.log(req.method, req.url);
  next();
});

adminRouter.get('/', function(req, res) {
  res.send('Admin panel');
});

adminRouter.get('/users', function (req, res) {
  res.send('Users list');
});

adminRouter.get('/posts', function(req, res) {
  res.send('Posts list');
})

app.use('/admin', adminRouter)