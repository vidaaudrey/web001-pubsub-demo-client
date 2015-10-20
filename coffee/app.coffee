express = require 'express'
app = express()
server = require('http').createServer app
io = require('socket.io').listen server 

subSocket = require './libs/subscribe'
badges = require './models/badges'


app.use express.static('public')

server.listen 3000, ()->
    console.log 'Client listening to 3000...'

app.get '/', (req, res) ->
    res.sendFile './public/index.html'

io.sockets.on 'connection', (socket) ->
    badges.get (err, data)->
        return if err 
        socket.emit('badge', badge) for badge in data 

subSocket.on 'message', (message)->
    io.sockets.emit 'badge', message