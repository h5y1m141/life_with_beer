'use strict';

angular.module('LifeWithBeerApp')
  .directive('previewArea',['$window', function($window) {
    return {
      restrict: 'E',
      template: '<h3>エリア表示</h3>',
      scope: {
        item: '=data'
      }
    };
  }]);
