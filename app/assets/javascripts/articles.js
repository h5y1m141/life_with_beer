var renderGoogleMap = function(latitude, longitude){
	var latlng = new google.maps.LatLng(latitude, longitude),
      mapOptions = {
		    zoom: 14,
		    center: latlng,
		    mapTypeId: google.maps.MapTypeId.ROADMAP
	    },
	    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions),          
      marker = new google.maps.Marker({
        position: latlng,
        map: map
      });
};
$(window).on('load',function(){
	var latitude = $('#placeLatitude').attr('value'), 
      longitude = $('#placeLongitude').attr('value');
  renderGoogleMap(latitude,longitude);
});

