// Generated by CoffeeScript 1.9.3
(function() {
  var app, badges, express, io, server, subSocket;

  express = require('express');

  app = express();

  server = require('http').createServer(app);

  io = require('socket.io').listen(server);

  subSocket = require('./libs/subscribe');

  badges = require('./models/badges');

  app.use(express["static"]('public'));

  server.listen(3000, function() {
    return console.log('Client listening to 3000...');
  });

  app.get('/', function(req, res) {
    return res.sendFile('./public/index.html');
  });

  io.sockets.on('connection', function(socket) {
    return badges.get(function(err, data) {
      var badge, i, len, results;
      if (err) {
        return;
      }
      results = [];
      for (i = 0, len = data.length; i < len; i++) {
        badge = data[i];
        results.push(socket.emit('badge', badge));
      }
      return results;
    });
  });

  subSocket.on('message', function(message) {
    return io.sockets.emit('badge', message);
  });

}).call(this);
