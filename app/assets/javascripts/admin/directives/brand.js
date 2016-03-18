'use strict';

angular.module('LifeWithBeerApp')
  .directive('brand',['Item', function(Item) {
    return {
      restrict: "A",
      link: function($scope, $element, $attrs, $controllers) {
        $scope.$watch('brandName', function(html){
          var params = {
            item: {
              brand: $scope.brandName
            }          
          };
          var data = Item.search_by_brand(params);
          data.$promise.then(function(response){
            $scope.items = response.items;
          });
        });
      }
    };
  }]);
