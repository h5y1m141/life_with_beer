'use strict';

angular.module('LifeWithBeerApp')
  .factory('Area', ['$resource' ,function ($resource) {
    return $resource('/admin/areas/:id.json',{
      id: '@id'
    },{
      fetchPlacesBelongToThisArea: {
        method: 'POST',
        url: '/admin/areas/places_belong_to_this_area.json',
        params: {
          area: '@value'
        },
        isArray:true
      }
    });
  }]);
