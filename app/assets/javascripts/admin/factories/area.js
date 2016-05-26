'use strict';

angular.module('LifeWithBeerApp')
  .factory('Area', ['$resource' ,function ($resource) {
    return $resource('/admin/areas/:id.json',{
      id: '@id'
    });
  }]);
