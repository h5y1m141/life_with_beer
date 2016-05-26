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
      if $('#place__summary').length
        areaGeoData = {
          latitude: $('#placeLatitude').attr('value'),
          longitude: $('#placeLongitude').attr('value')
        }
        @googleMap.render(geoDataList, areaGeoData,'map_place_summary')

      # エリア情報の設定
      areaPlaceList = []
      if $('#area__place').length
        $('.area__place__list > li').each (index, element) ->
          areaPlaceList.push({
            latitude: $(element).attr('data-latitude'),
            longitude: $(element).attr('data-longitude')
          })
        areaGeoData = {
          latitude: $('#area__place').attr('data-area-latitude'),
          longitude: $('#area__place').attr('data-area-longitude')
        }
        @googleMap.render(areaPlaceList, areaGeoData, 'map_canvas')


      # 記事中のエリアサマリー情報の設定
      areaPlaceListSummary = []
      if $('#area__place__summary').length
        $('.area__place__list__summary > li').each (index, element) ->
          areaPlaceListSummary.push({
            latitude: $(element).attr('data-latitude'),
            longitude: $(element).attr('data-longitude')
          })
        areaSummaryGeoData = {
          latitude: $('#area__place__summary').attr('data-area-latitude'),
          longitude: $('#area__place__summary').attr('data-area-longitude')
        }
        @googleMap.render(areaPlaceListSummary, areaSummaryGeoData, 'map_area_summary')
