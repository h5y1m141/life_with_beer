'use strict';

angular.module('LifeWithBeerApp')
  .controller('BreweryCtrl', ['$scope', function ($scope) {
    $scope.selectedSocialAccounts = [];
    $scope.socialAccountsAttributes = [];
    // 画面上部の入力項目のタブ用のscope
    $scope.tabs = [
      { title: '基本情報'},
      { title: 'SNS情報'},
      { title: '商品登録'},
    ];
    $scope.selectedTab = 0;
    $scope.selectTab = function(index){
      $scope.selectedTab = index;
    };
  }]);
