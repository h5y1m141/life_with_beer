'use strict';

angular.module('LifeWithBeerApp')
  .controller('ArticleCtrl', ['$scope','Article','Picture', function ($scope, Article, Picture) {
    var prepareArticleData = function(contents){
      var result = [];
      angular.forEach(contents, function(content, key){
        result.push({
          tag_name: content.tag_name,
          element_data: content.element_data,
          sory_key: key + 1
        });
      });
      return result;
    };
    // 画面上部の入力項目のタブ用のscope
    $scope.tabs = [
      { title: '記事の基本情報'},
      { title: '文章登録'},
      { title: 'アイテム登録'},
      { title: 'Instagram登録'},
      { title: '画像登録'}
    ];
    $scope.selectedTab = 0;
    $scope.selectedItems = [];
    $scope.articleCreated = false;
    $scope.articleNotCreated = false;
    $scope.selectTab = function(index){
      $scope.selectedTab = index;
    };
    // プレビューエリアの表示のために利用
    $scope.contentsArea = [];

    $scope.saveArticle = function(){
      var elementsAttributes = prepareArticleData($scope.contentsArea),
          createArticle = $scope.createArticle,
          query;
      query = Article.save({
        title: $scope.mainTitle,
        publish_status: 0,
        elements_attributes: elementsAttributes
      });
      query.$promise.then(function(response){
        if(response.title){
          $scope.articleCreated = true;

        } else {
          $scope.articleNotCreated = true;
        }
        $scope.mainTitle = '';
        $scope.contentsArea = [];
      });
    };
    $scope.insertInstagram = function(){
      $scope.contentsArea.push({
        tag_name: 'instagram',
        element_data: $scope.instagram
      });
    };
    $scope.selectItem = function(item){
      $scope.contentsArea.push({
        tag_name: 'item',
        element_data: item
      });
    };
    $scope.init = function(json){
      var query,
          article = JSON.parse(json);
      $scope.mainTitle = article.title;
      query = Article.loadElements({id: article.id });
      query.$promise.then(function(response){
        angular.forEach(response.elements,function(element){
          $scope.contentsArea.push(element);
        });
      });
    };
    $scope.uploadImage = function(fileSrc, fileType){
      var query,
          formData = new FormData();
      formData.append('file',fileSrc);
      query = Picture.fileUpload(formData);
      query.$promise.then(function(response){
        var image = response.image;
        $scope.contentsArea.push({
          tag_name: 'img',
          element_data: image,
          imagePath: image.image.url          
        });
        $scope.imageFileSrc = null;
        $('.imageFile').val('');        
      });
    };
    $scope.$watch("imageFile", function (imageFile) {
      $scope.imageFileSrc = undefined;
      if (!imageFile || !imageFile.type.match("image.*")) {
        return;
      }
      var reader = new FileReader();
      reader.onload = function () {
        $scope.$apply(function () {
          $scope.imageFileSrc = reader.result;
        });
      };
      reader.readAsDataURL(imageFile);
    });    
  }]);
