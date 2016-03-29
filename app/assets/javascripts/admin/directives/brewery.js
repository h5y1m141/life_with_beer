'use strict';

angular.module('LifeWithBeerApp')
  .directive('brewery',['Item', function(Item) {
    return {
      restrict: "A",
      link: function($scope, $element, $attrs, $controllers) {
        $scope.$watch('breweryName', function(html){
          var params = {
            item: {
              brewery: $scope.breweryName
            }          
          };
          var data = Item.search_by_brewery(params);
          data.$promise.then(function(response){
            console.log(response);
            $scope.items = response.items;
          });
        });
      }
    };
  }]);
