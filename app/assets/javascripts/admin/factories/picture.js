'use strict';

angular.module('LifeWithBeerApp')
  .factory('Picture', ['$resource' ,function ($resource) {
    return $resource('/admin/pictures/:id.json',{
      id: '@id'
    },{
      fileUpload: {
        method: 'POST',
        transformRequest: angular.identity,
        headers: {
          'Content-type':undefined
        },
        url: '/admin/pictures.json',
        params: {
          fille: '@value'
        }        
      }
    });
  }]);    
