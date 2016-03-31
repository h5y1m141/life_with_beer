'use strict';

angular.module('LifeWithBeerApp')
  .controller('PlaceCtrl', ['$scope', function ($scope) {
    $scope.latitude = null;
    $scope.longitude = null;
    $scope.init = function(latitude, longitude){
      $scope.latitude = latitude;
      $scope.longitude = longitude;
	    var mapOptions = {
		    zoom: 15,
		    center: new google.maps.LatLng($scope.latitude, $scope.longitude),
		    mapTypeId: google.maps.MapTypeId.ROADMAP
	    },
	        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions),
          latlng = new google.maps.LatLng($scope.latitude, $scope.longitude),
          marker = new google.maps.Marker({
            position: latlng,
            map: map
          });
    };
  }]);
