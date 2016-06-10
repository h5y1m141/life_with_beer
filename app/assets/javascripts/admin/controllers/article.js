angular.module('LifeWithBeerApp')
  .controller('ArticleCtrl', ['$scope', 'Article','Place', function ($scope, Article, Place) {
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
      { title: '画像登録'},
      { title: 'お店登録'},
      { title: 'エリア登録'}
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
    $scope.selectedPlaces = [];
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
    $scope.searchWithRansack =  function(){
      var query,
          str = {
            prefecture_id_in: $scope.selectedPrefecture.code,
            name_start: $scope.placeName
          };
      query = Place.query({q: str});
      query.$promise.then(function(response){
        $scope.searchResultPlaces = response;
      });
    };
    $scope.fetchPrefectures = function(data){
      return $scope.prefectures = data;
    };
    $scope.fetchAreas = function(data){
      return $scope.areas = data;
    };
    $scope.selectPlace = function(place){
      // Rails側に送信する情報はnested_attributes用の値と
      // プレビュー用のデータを分けるためにプロパティを別途設定
      $scope.contentsArea.push({
        tag_name: 'place',
        place_data: place,
        element_data: place.id
      });
    };
  }]);
