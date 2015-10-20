request = require 'request'

exports.get = (callback)->
    request 'http://localhost:8000/badges', (err, res, body) ->
        callback err, JSON.parse(body)