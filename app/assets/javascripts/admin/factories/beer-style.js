'use strict';

angular.module('LifeWithBeerApp')
  .factory('BeerStyle', ['$resource' ,function ($resource) {
    return $resource('/admin/beer_styles/:id.json',{
      id: '@id'
    });
  }]);
