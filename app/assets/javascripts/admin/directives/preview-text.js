'use strict';

angular.module('UrbanOutdoorApp')
  .directive('previewText', function($compile) {
    var selectTemplate = function(tag){
      var baseTemplate;
      if(tag === 'sub_head'){
        baseTemplate = '<h3 ng-hide="view.editorEnabled">' +
          '  {{contents}} ' +
          '  <a class="btn btn-info btn-xs" ng-click="enableEditor()">編集</a>' +
          '</h3>';
      } else {
        baseTemplate = '<h4 ng-hide="view.editorEnabled">' +
          '  {{contents}} ' +
          '  <a class="btn btn-info btn-xs" ng-click="enableEditor()">編集</a>' +
          '</h4>';
      }
      return '<div class="click-to-edit">' +
        baseTemplate +
        '<div ng-show="view.editorEnabled">' +
        '  <input class="form-control" ng-model="view.editableValue">' +
        '  <a class="btn btn-primary btn-xs" href="#" ng-click="save()">保存</a>' +
        '   or ' +
        '  <a class="btn btn-danger btn-xs" ng-click="disableEditor()">取り消し</a>.' +
        '</div>' +
        '</div>';
    };

    return {
      restrict: 'E',
      scope: {
        tag: '=tag',
        contents: '=data'
      },
      link: function (scope, element, attrs) {
        var template;
        template = selectTemplate(scope.tag);
        element.html(template);
        $compile(element.contents())(scope);
      },
      controller: function($scope) {
        $scope.view = {
          editableValue: $scope.contents,
          editorEnabled: false
        };

        $scope.enableEditor = function() {
          $scope.view.editorEnabled = true;
          $scope.view.editableValue = $scope.contents;
        };

        $scope.disableEditor = function() {
          $scope.view.editorEnabled = false;
        };

        $scope.save = function() {
          $scope.contents = $scope.view.editableValue;
          $scope.disableEditor();
        };
      }
    };
  });
