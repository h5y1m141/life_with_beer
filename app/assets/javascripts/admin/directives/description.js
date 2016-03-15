'use strict';

angular.module('UrbanOutdoorApp')
  .directive('description', function($compile) {
    return {
      restrict: 'E',
      scope: {
        description: '=data',
        contents: '=contents'
      },
      link: function (scope, element, attrs) {
        element.bind('click', function (e) {
          var idSelector = e.target.id;
          if(idSelector === 'subHead') {
            scope.contents.push({
              tag_name: 'sub_head',
              element_data: scope.description
            });
          } else {
            scope.contents.push({
              tag_name: 'description',
              element_data: scope.description
            });
          }
          scope.description = '';
          scope.$apply();
        });
        scope.$watch('description', function(html){
          var subHeadButton,
              descriptionButton;
          if(html) {
          subHeadButton = '<button id="subHead" class="btn-info">見出しとして登録</button>';
          descriptionButton = '<button id="description" class="btn-info">説明文として登録</button>';            
            element.html(subHeadButton + descriptionButton);
            $compile(element.contents())(scope);
          }
        });
      }
    };
  });
