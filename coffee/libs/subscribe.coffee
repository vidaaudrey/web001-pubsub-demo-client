axon = require 'axon'
socket = axon.socket 'sub'

socket.connect 8000

socket.on 'error', (err) ->
    throw err 

module.exports = socket
