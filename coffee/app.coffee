express = require 'express'
app = express()

app.use express.static('public')

app.listen 3000, ()->
    console.log 'Client listening to 3000...'

app.get '/', (req, res) ->
    res.sendFile './public/index.html'
