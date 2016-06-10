'use strict';

angular.module('LifeWithBeerApp')
  .directive('previewPlace',['$compile','Place', function($compile, Place) {
    var prepareMap = function(div, place){
      var mapOptions,
          map,
          marker,
          latlng = new google.maps.LatLng(place.latitude, place.longitude);
      mapOptions = {
        center: latlng,
        zoom: 15
      };
      map = new google.maps.Map(div, mapOptions);
      marker = new google.maps.Marker({
        position: latlng
      });
      marker.setMap(map);
      return map;


    };    
    return {
      restrict: 'E',
      scope: {
        place: '=data'
      },
      controller: function($scope, $element){
        var query,
            div = $element[0].getElementsByClassName('map')[0];
        query = Place.get({
          id: $scope.place
        });
        query.$promise.then(function(place){
          prepareMap(div, place);  
        });
        
      },
      template: '<div class="map" style="width:500px;height:300px;"></div>'
    };
  }]);
