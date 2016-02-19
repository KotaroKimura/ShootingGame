express = require('express')
app     = express()
http    = require('http').Server(app)
port    = 3000

# set static file dir
app.use '/assets', express.static(__dirname + '/assets')

# set vender static file dir
app.use '/vender', express.static(__dirname + '/vender')

app.get '/', (req, res) ->
  res.sendfile 'views/coffeeTest.html'

http.listen port, ->
  console.log 'listening on *:', port
