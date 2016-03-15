'use strict';

angular.module('UrbanOutdoorApp')
  .directive('previewItem',['$window', function($window) {
    return {
      restrict: 'E',
      template: '<img class="article__contents__preview__thumb" ng-src="{{ item.thumbnail.image }}"/>',
      scope: {
        item: '=data'
      }
    };
  }]);
