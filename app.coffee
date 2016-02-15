express = require('express')
app     = express()
http    = require('http').Server(app)
port    = 3000

# set static file dir
app.use '/assets', express.static(__dirname + '/assets')

app.get '/', (req, res) ->
  res.sendfile 'coffeeTest.html'

http.listen port, ->
  console.log 'listening on *:', port
