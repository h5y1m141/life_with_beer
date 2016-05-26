'use strict';

angular.module('LifeWithBeerApp')
  .directive('previewArea',['$compile', function($compile) {
    return {
      restrict: 'E',
      scope: {
        area: '=data'
      },
      controller: function($scope, $element){
        var div, mapOptions, map;
        div = $element[0].getElementsByClassName('map')[0];
        mapOptions = {
          center: new google.maps.LatLng($scope.area.latitude, $scope.area.longitude),
          zoom: 15
        };
        map = new google.maps.Map(div, mapOptions);
      },
      template: '<h3>表示されるエリア（実際の画面では該当エリア内のお店の場所にピンが立ちます）</h3><div class="map" style="width:500px;height:500px;"></div>'
    };
  }]);
