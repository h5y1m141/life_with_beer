angular.module('LifeWithBeerApp')
  .directive('selectArea', function($compile) {
    return {
      restrict: 'E',
      scope: {
        area: '=data',
        contents: '=contents'
      },
      link: function (scope, element, attrs) {
        element.bind('click', function (e) {
          scope.contents.push({
            tag_name: 'area',
            place_data: scope.area,
            element_data: scope.area.id
          });
          scope.$apply();
        });
      }
    };
  });
