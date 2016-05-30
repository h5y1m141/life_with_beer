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
    var prepareMarker = function(place, _scope, map){
      var marker,
          latlng = new google.maps.LatLng(place.latitude, place.longitude);
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
        _scope.places.push(this.data);
        _scope.$apply();
      });
      marker.setMap(map);
      return marker;
    };
    var markerInfo = function(marker, name, place) {
      google.maps.event.addListener(marker, 'click', function (event) {
        new google.maps.InfoWindow({
          content: name,
          placeData: place
        }).open(marker.getMap(), marker);
      });
    };
    return {
      restrict: 'E',
      scope: {
        area: '=data',
        places: '=places',
        contents: '=contents'
      },
      link: function ($scope, $element, attrs) {
        $element.bind('click', function(event){
          var place;
          if(event.target.value){
            place = JSON.parse(event.target.value);
            $scope.contents.push({
              tag_name: 'place',
              place_data: place
            });
            $scope.$apply();
          }
        });
        $scope.$watch('area', function(html){
          var div,
              map,
              marker,
              query,
              latlng = new google.maps.LatLng($scope.area.latitude, $scope.area.longitude);
          $scope.selectedPin = $scope.area.name;
          query = Area.fetchPlacesBelongToThisArea({id: $scope.area.id });
          query.$promise.then(function(response){
            var _marker;
            angular.forEach(response, function(place, key){
              var content = '<ul class="list-inline"><li><h4>' + place.name + "</h4></li><li><button value='" + JSON.stringify(place) + "' class='btn btn-info btn-sm'>登録する</button></li></ul>";
              marker = prepareMarker(place, $scope, map);
              markerInfo(marker, content, place);
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
      template: '<div class="searchPlaceMap" style="width:800px;height:500px;"></div>'
    };
  }]);
