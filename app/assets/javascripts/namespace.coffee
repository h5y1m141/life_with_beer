@LifeWithBeer = (fn) ->
  klass = fn()
  @LifeWithBeer[klass.name] = klass
