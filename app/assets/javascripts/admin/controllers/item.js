'use strict';

angular.module('UrbanOutdoorApp')
  .controller('ItemCtrl', ['$scope', function ($scope) {
    $scope.init = function(thumbnail, pictures){
      var _thumbnail = JSON.parse(thumbnail);
      $scope.pictures = JSON.parse(pictures);
      if(thumbnail){
        $scope.thumbnail = _thumbnail;
      } else {
        $scope.thumbnail = $scope.pictures[0];
      }
    };
    $scope.selectThumbnail = function(index) {
      $scope.thumbnail = $scope.pictures[index];
    };
  }]);
