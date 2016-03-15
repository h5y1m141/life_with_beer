'use strict';

angular.module('UrbanOutdoorApp')
  .directive("instagram",['$window','$q','$compile', function($window, $q, $compile) {
    return {
      restrict: 'E',
      template: '<blockquote class="instagram-media" data-instgrm-captioned data-instgrm-version="5"><a ng-href="{{instagram}}" target="_blank"></a></blockquote>',
      scope: {
        instagram: '=data'
      },
      link: function (scope, element, attrs) {
        scope.$watch( 'instagram' , function(html){
          $compile(element.contents())(scope);
          instgrm.Embeds.process();
        });
      }
    };
  }]);
