angular.module('LifeWithBeerApp')
  .directive('selectPlace', function($compile) {
    return {
      restrict: 'E',
      scope: {
        place: '=data',
        contents: '=contents'
      },
      link: function (scope, element, attrs) {
        element.bind('click', function (e) {
          scope.contents.push({
            tag_name: 'place',
            place_data: scope.place,
            element_data: scope.place.id
          });
          scope.$apply();
        });
      }
    };
  });
