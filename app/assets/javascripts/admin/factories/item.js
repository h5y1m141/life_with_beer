'use strict';

angular.module('LifeWithBeerApp')
  .factory('Item', ['$resource' ,function ($resource) {
    return $resource('/admin/items/:id.json',{
      id: '@id'
    },{
      search_by_tag: {
        method: 'POST',
        url: '/admin/items/search_by_tag.json',
        params: {
          item: '@value'
        }
      },
      search_by_brewery: {
        method: 'POST',
        url: '/admin/items/search_by_brewery.json',
        params: {
          item: '@value'
        }
      }
    });
  }]);
