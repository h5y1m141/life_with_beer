'use strict';

angular.module('LifeWithBeerApp')
  .factory('Article', ['$resource' ,function ($resource) {
    return $resource('/admin/articles/:id.json',{
      id: '@id'
    },{
      save: {
        method: 'POST',
        article: '@value',
        headers : {
          'Content-Type': 'application/json'
        }
      },
      update: {
        method: 'PUT',
        params: {
          article: '@value'
        },
        headers : {
          'Content-Type': 'application/json'
        }
      },
      loadElements: {
        method: 'POST',
        headers : {
          'Content-Type': 'application/json'
        },
        url: '/admin/articles/load_elements.json',
        params: {
          id: '@value'
        }
      }
    });
  }]);
