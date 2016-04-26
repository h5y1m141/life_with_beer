angular.module('LifeWithBeerApp')
  .directive('selectItem', function($compile) {
    return {
      restrict: 'E',
      scope: {
        item: '=data',
        contents: '=contents'
      },
      link: function (scope, element, attrs) {
        element.bind('click', function (e) {
          scope.contents.push({
            tag_name: 'item',
            item_data: scope.item,
            element_data: scope.item.id
          });
          scope.$apply();
        });
      }
    };
  });
