'use strict';

angular.module('LifeWithBeerApp')
  .directive("picture", function($compile) {
    return {
      restrict: 'A',
      replace: true,
      scope: { picture: '=picture'},
      template: '<img ng-src="{{value}}" >',
      link: function postLink(scope, element, attrs) {
        scope.$watch('picture' , function(html){
          attrs.$set('src',scope.picture);
        });
      }
    };
  });
