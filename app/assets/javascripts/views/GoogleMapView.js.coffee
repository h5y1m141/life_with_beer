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

    @mapOptions.center = @latlngs[0]
    
  prepareMarker: () ->
    for latlng in @latlngs
      marker = new google.maps.Marker({
        position: latlng
      })
      @markers.push(marker)
      
  render: (geoDataList) ->
    @geoDataList = geoDataList
    @generateLatLng()
    @prepareMarker()
    map = new (google.maps.Map)(document.getElementById("map_canvas"), @mapOptions)
    for marker in @markers
      marker.setMap(map)
