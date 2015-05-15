express = require('express')
app = express()
path = require('path')
app.get '/', (req, res) ->
  res.sendFile path.join(__dirname + '/index.html')
  return
app.listen 1337

adminRouter = express.Router()

adminRouter.use (req, res, next) ->
  console.log req.method, req.url
  next()
  return


adminRouter.param 'name', (req, res, next, name) ->
  console.log 'Validation of '+name+' is in progress.'

  req.name = name
  next()
  return


adminRouter.get '/', (req, res) ->
  res.send 'Admin panel'
  return

adminRouter.get '/users/:name', (req, res) ->
  res.send 'hello ' + req.params.name
  return

adminRouter.get '/posts', (req, res) ->
  res.send 'Posts list'
  return

app.use '/admin', adminRouter


app.route '/login'
  .get (req, res) ->
    res.send('this is the login form')
    return
  .post (req, res) ->
    console.log 'login form processing'
    res.send('processing the login form')
    return
