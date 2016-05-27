'use strict';

angular.module('LifeWithBeerApp')
  .directive('searchPlace',['$compile','Area', function($compile, Area) {
    var prepareMap = function(div, area){
      var mapOptions,
          map,
          latlng = new google.maps.LatLng(area.latitude, area.longitude);
      mapOptions = {
        center: latlng,
        zoom: 15
      };
      map = new google.maps.Map(div, mapOptions);
      return map;
    };
    return {
      restrict: 'E',
      scope: {
        area: '=data',
        places: '=places'
      },
      link: function ($scope, $element, attrs) {
        $scope.$watch('area', function(html){
          var div,
              map,
              marker,
              query,
              latlng = new google.maps.LatLng($scope.area.latitude, $scope.area.longitude);
          $scope.selectedPin = $scope.area.name;
          query = Area.fetchPlacesBelongToThisArea({id: 1});
          query.$promise.then(function(response){
            angular.forEach(response, function(place, key){
              var latlng,
                  marker;
              latlng= new google.maps.LatLng(place.latitude, place.longitude);
              marker = new google.maps.Marker({
                position: latlng,
                data: {
                  placeID: place.id,                  
                  name: place.name,
                  latitude: place.latitude,
                  longitude: place.longitude
                }
              });
              google.maps.event.addListener(marker, 'click', function(url){
                $scope.places.push(this.data);
                $scope.$apply();
              });
              marker.setMap(map);
            });
          });
          div = $element[0].getElementsByClassName('searchPlaceMap')[0];
          map = prepareMap(div, $scope.area);
          marker = new google.maps.Marker({
            position: latlng
          });
          marker.setMap(map);
          $compile($element.contents())($scope);
        });
      },
      controller: function($scope, $element){
        var div = $element[0].getElementsByClassName('searchPlaceMap')[0];
        prepareMap(div, $scope.area);
      },
      template: '<div class="searchPlaceMap" style="width:800px;height:500px;"></div>{{ selectedPin }}{{ places }}'
    };
  }]);
