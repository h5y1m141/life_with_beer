'use strict';

/**
 * @ngdoc overview
 * @name LifeWithBeerApp
 * @description
 * # LifeWithBeerApp
 *
 * Main module of the application.
 */
angular
  .module('LifeWithBeerApp', [
    'ngResource'
  ])
  .config(["$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }]);

