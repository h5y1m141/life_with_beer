@LifeWithBeer -> class Main
  constructor: () ->
    @controller = new LifeWithBeer.MainController()

ready = ->
  todo = new LifeWithBeer.Main()
  
$(document).ready(ready)


