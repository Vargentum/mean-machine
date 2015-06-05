express = require('express')
app = express()

bodyParser = require('body-parser')
mongoose = require('mongoose')
morgan = require('morgan')

port = process.env.PORT || 7042

# grab info from POST requests
app.use(bodyParser.urlencoded(
  extended: on
))
app.use(bodyParser.json())

# handle CORS requests
app.use((req, res, next)->
  res.setHeader 'Access-Control-Allow-Origin', '*'
  res.setHeader 'Access-Control-Allow-Methods', 'GET, POST'
  res.setHeader 'Access-Control-Allow-Headers', 'X-Requested-With, content-type, \Authorisation'
  next()
)

# log all requests to console
app.use(morgan('dev'))


app.get('/', (req, res) ->
  res.send('Home page')
)

# Use api
apiRouter = express.Router()
apiRouter.get('/', (req, res) ->
  res.json(
    message: 'Welcome to our API'
  )
)
app.use('/api', apiRouter)


app.listen(port)
console.log 'Server works on port ' + port