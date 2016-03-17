'use strict';

angular.module('LifeWithBeerApp')
  .directive('socialAccountList',['$compile', function($compile) {
    return {
      restrict: 'EA',
      scope: {
        socialAccountList: '=data',
        selectedSocialAccounts: '=accounts'
      },
      compile: function(elm, attrs, transclude){
        return function postLink(scope, elm, attrs) {          
          scope.$watch('socialAccountList', function(socialAccountList) {
            if(socialAccountList){
              var template = '<select class="form-control" ng-model="selectedSocialAccount" ng-options="account as account.name for account in socialAccountList"></select>' +
                    '<div col-xs-8>' +
                    '<input type="text" ng-model="url" class="form-control" placeholder="URLを入力してください">' + 
                    '<a class="btn btn-info" ng-click="select()">追加</a>' +
                    '</div>';
              
              elm.html(template); 
              $compile(elm.contents())(scope);
              scope.selectedSocialAccount = socialAccountList[0];
            }
          });
        };
      },
      controller: function($scope){
        $scope.select = function(){
          var params;
          params = {
            account_type: $scope.selectedSocialAccount.index,
            url: $scope.url
          };
          $scope.selectedSocialAccounts.push(params);
        };
      }
    };
  }]);


