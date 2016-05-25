@LifeWithBeer -> class GoogleMapView
  constructor: () ->
    @geoDataList = null
    @mapOptions = {
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @latlngs = []
    @markers = []

  generateLatLng: () ->
    for geoData in @geoDataList
      latlng = new (google.maps.LatLng)(geoData.latitude, geoData.longitude)
      @latlngs.push(latlng)

  prepareMarker: () ->
    for latlng in @latlngs
      marker = new google.maps.Marker({
        position: latlng
      })
      @markers.push(marker)

  calcCenterLatLng: (geoData) ->
    return new (google.maps.LatLng)(geoData.latitude, geoData.longitude)

  render: (geoDataList, areaGeoData) ->
    @geoDataList = geoDataList
    @generateLatLng()
    @prepareMarker()
    mapOptions = {
      zoom: 14,
      center: @calcCenterLatLng(areaGeoData),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new (google.maps.Map)(document.getElementById("map_canvas"), mapOptions)
    for marker in @markers
      marker.setMap(map)
