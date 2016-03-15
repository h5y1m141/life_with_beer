'use strict';

angular.module('UrbanOutdoorApp')
  .directive('titleLength',['$compile', function($compile) {
    var selectTemplate = function(title){
      var safeLengthMessage = '<span class="label label-danger">文字数：{{ title.length }}</span>';
      var dangerLengthMessage = '<span class="label label-success">文字数：{{ title.length }}</span>';    
      return (title.length > 32) ?  safeLengthMessage : dangerLengthMessage;
    };
    return {
      restrict: 'EA',
      scope: {
        title: '=data'
      },
      compile: function(elm, attrs, transclude){
        return function postLink(scope, elm, attrs, tabsetCtrl) {
          scope.$watch('title', function(title) {
            if(title){
              var template = selectTemplate(title);
              elm.html(template);
              $compile(elm.contents())(scope);
            } else {
              elm.html('');
              $compile(elm.contents())(scope);              
            }
          });
        };
      }
    };
  }]);
