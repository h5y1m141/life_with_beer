'use strict';

angular.module('LifeWithBeerApp')
  .directive('socialAccountList',['$compile', function($compile) {
    return {
      restrict: 'EA',
      scope: {
        socialAccountList: '=data',
        selectedSocialAccounts: '=accounts',
        socialAccountsAttributes: '=attributes'
      },
      compile: function(elm, attrs, transclude){
        return function postLink(scope, elm, attrs) {
          scope.$watch('socialAccountList', function(socialAccountList) {
            if(socialAccountList){
              var template = '<ul class="list-unstyled"><li ng-repeat="account in socialAccountList">' +
                    '<div class="form-group">' +
                      '<label class="control-label col-xs-2">{{ account.name }}</label>' +
                      '<div class="col-xs-10">' +
                      '<input type="text" ng-model="socialAccounts[account.index]" class="form-control" placeholder="URLを入力してください">' +
                      '</div>' +
                    '</div>' +
                    '</li></ul>';
              elm.html(template);
              $compile(elm.contents())(scope);
              scope.socialAccountsAttributes.push(scope.socialAccounts);
              scope.selectedSocialAccounts.push(scope.socialAccounts);
            }
          });
        };
      },
      controller: function($scope){
        $scope.socialAccounts = {};
      }
    };
  }]);
