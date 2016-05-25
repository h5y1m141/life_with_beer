### jQuery Tiny Pub/Sub - v0.7 - 10/27/2011
# http://benalman.com/
# Copyright (c) 2011 "Cowboy" Ben Alman; Licensed MIT, GPL 
###

(($) ->
  o = $({})

  $.subscribe = ->
    o.on.apply o, arguments
    return

  $.unsubscribe = ->
    o.off.apply o, arguments
    return

  $.publish = ->
    o.trigger.apply o, arguments
    return

  return
) jQuery

