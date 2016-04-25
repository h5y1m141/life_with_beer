'use strict';

angular.module('LifeWithBeerApp')
  .directive('place',['Place', function(Place) {
    return {
      restrict: 'A',
      link: function($scope, $element, $attrs, $controllers) {
        $scope.$watch('prefectureName', function(html){
          var params = {
            prefectureName: prefectureName
          };
          var data = Place.query(params);
          data.$promise.then(function(response){
            $scope.items = response.items;
          });
        });
      }
    };
  }]);
