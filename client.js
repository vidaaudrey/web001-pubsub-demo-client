// Generated by CoffeeScript 1.9.3
(function() {
  $(function() {
    var socket;
    socket = io.connect();
    return socket.on('badge', function(badge) {
      var $img;
      $img = $('<img src="' + badge.badge_id(+'" alt="Badge Code">'));
      return $('body').prepend($img);
    });
  });

}).call(this);
