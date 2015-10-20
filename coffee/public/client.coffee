$ ()->
    socket = io.connect()
    socket.on 'badge', (badge) ->
        #store the images in the right folder 
        $img = $("<img src='#{badge.badge_id}'' alt='Badge Code'>")
        $('body').prepend($img)