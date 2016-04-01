'use strict';

angular.module('LifeWithBeerApp')
  .controller('PlaceCtrl', ['$scope', function ($scope) {
    $scope.selectedSocialAccounts = [];
    $scope.latitude = null;
    $scope.longitude = null;
    var renderGoogleMap = function(latitude, longitude){
	    var latlng = new google.maps.LatLng(latitude, longitude),
          mapOptions = {
		        zoom: 15,
		        center: latlng,
		        mapTypeId: google.maps.MapTypeId.ROADMAP
	        },
	        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions),          
          marker = new google.maps.Marker({
            position: latlng,
            map: map
          });
    };
    $scope.init = function(latitude, longitude){
      $scope.latitude = latitude;
      $scope.longitude = longitude;
      renderGoogleMap($scope.latitude, $scope.longitude);
    };
    $scope.$watch('latitude',function(newVal){
      if(newVal){
        $scope.latitude = newVal;
      }
      renderGoogleMap($scope.latitude, $scope.longitude);
    });
    $scope.$watch('longitude',function(newVal){
      if(newVal){
        $scope.longitude = newVal;
      }
      renderGoogleMap($scope.latitude, $scope.longitude);
    });    
  }]);
