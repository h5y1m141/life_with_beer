'use strict';

angular.module('LifeWithBeerApp')
  .directive('previewPlace',['$window', function($window) {
    return {
      restrict: 'E',
      template: '<h3>{{ item.name }}</h3>',
      scope: {
        item: '=data'
      }
    };
  }]);
