'use strict';

angular.module('LifeWithBeerApp')
  .directive("picture", ['$compile', 'Picture', function($compile, Picture) {
    return {
      restrict: 'A',
      replace: true,
      scope: { picture: '=picture'},
      template: '<img ng-src="{{value}}" >',
      link: function postLink(scope, element, attrs) {
        scope.$watch('picture' , function(html){
          var query =  Picture.get({ id: 7 });
          query.$promise.then(function(response){
            var picture = response.image;
            attrs.$set('src',picture.url);
          });          
        });
      }
    };
  }]);
