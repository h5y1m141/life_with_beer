'use strict';

angular.module('LifeWithBeerApp')
  .controller('BeerStyleCtrl', ['$scope','BeerStyle', function ($scope, BeerStyle) {
    $scope.style = 'セゾン';
  }]);
