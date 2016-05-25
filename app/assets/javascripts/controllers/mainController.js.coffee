@LifeWithBeer -> class MainController
  constructor: () ->
    @googleMap = new LifeWithBeer.GoogleMapView()
    @bindEvent()

  bindEvent: ()->
    $(window).on 'load', =>
      # 記事詳細ページ用の設定
      geoDataList = []
      geoDataList.push({
        latitude: $('#placeLatitude').attr('value'),
        longitude: $('#placeLongitude').attr('value')
      })
      @googleMap.render(geoDataList)
      # エリア情報の設定
      areaPlaceList = [] 
      $('.area__place__list > li').each (index, element) ->
        areaPlaceList.push({
          latitude: $(element).attr('data-latitude'),
          longitude: $(element).attr('data-longitude')
        })
      @googleMap.render(areaPlaceList)
