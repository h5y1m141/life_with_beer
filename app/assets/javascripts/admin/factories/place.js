'use strict';

angular.module('LifeWithBeerApp')
  .factory('Place', ['$resource' ,function ($resource) {
    return $resource('/admin/places/:id.json',{
      id: '@id'
    });
  }]);
