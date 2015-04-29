express = require('express')
app = express()
path = require('path')
app.get '/', (req, res) ->
  res.sendFile path.join(__dirname + '/index.html')
  return
app.listen 1337
console.log '1337 is the magic port'

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
