'use strict';

angular.module('LifeWithBeerApp')
  .directive('socialAccountList',['$compile', function($compile) {
    return {
      restrict: 'EA',
      scope: {
        socialAccountData: '=data',
        selectedSocialAccounts: '=accounts',
        socialAccountsAttributes: '=attributes'
      },
      link: function (scope, element, attrs) {
        var template = '<ul class="list-unstyled"><li ng-repeat="list in socialAccounts">' +
              '<div class="form-group">' +
              '<label class="control-label col-xs-2">{{ list.name }}</label>' +
              '<div class="col-xs-10">' +
              '<input type="text" ng-model="list.url" class="form-control" placeholder="URL入力してください">' +
              '</div>' +
              '</div>' +
              '</li></ul>';
        element.html(template);
        $compile(element.contents())(scope);
        scope.socialAccountsAttributes.push(scope.socialAccounts);
        scope.selectedSocialAccounts = scope.socialAccounts;

      },
      controller: function($scope){
        $scope.socialAccounts = [];
        $scope.socialAccountList = [];
        angular.forEach($scope.socialAccountsAttributes,function(attribute, key){
          var name = attribute.name,
              url = '',
              accountID;
          angular.forEach($scope.socialAccountData,function(account){
            if(attribute.name === account.account_type){
              url = account.url;
              accountID = account.id;
            }
          });
          $scope.socialAccounts.push({
            social_account_id: accountID,
            index: key,
            name: name,
            url: url
          });
        });
      }
    };
  }]);
