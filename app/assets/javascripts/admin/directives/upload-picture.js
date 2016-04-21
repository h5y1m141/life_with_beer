'use strict';

angular.module('LifeWithBeerApp')
  .directive('uploadPicture',['$compile', 'Picture', function($compile, Picture) {
    return {
      restrict: 'E',
      scope: {
        contentsArea: '=data'
      },
      link: function (scope, element, attrs) {
        // ファイルアップロード領域の描画
        var inputElement = '<input class="imageFile" type="file" file-model="imageFile"></input>' +
              '<img class="article__contents__picture" ng-if="imageFileSrc" ng-src="{{ imageFileSrc }}" />' +
              '<ul class="list-inline" ng-if="imageFileSrc">' +
              '<li><button class="btn-info" ng-click="uploadImage()">アップロードする</button>' +
              '<li><button class="btn-danger" ng-click="resetImage()">リセット</button>' +
              '</ul>',
            progressBar = '<div ng-if="progressStatus" class="progress-bar progress-bar-striped active" style="width: 100%">' +
              'アップロード中......' +
              '</div>';

        element.html(progressBar + inputElement);
        $compile(element.contents())(scope);

        // アップロード画像が選択された後にプレビュー画像を表示する
        scope.$watch("imageFile", function (imageFile) {
          scope.imageFileSrc = undefined;
          //画像ファイルじゃなければ何もしない
          if(!imageFile || !imageFile.type.match("image.*")){
            return;
          }
          var reader = new FileReader();
          reader.onload = function () {
            scope.$apply(function () {
              scope.imageFileSrc = reader.result;
            });
          };
          reader.readAsDataURL(imageFile);
        });
      },
      controller: function($scope){
        $scope.progressStatus = false;
        $scope.uploadImage = function(){
          var query,
              formData = new FormData();
          $scope.progressStatus = true;
          formData.append('file', $scope.imageFileSrc);
          query = Picture.fileUpload(formData);
          query.$promise.then(function(response){
            var image = response.image;
            $scope.contentsArea.push({
              tag_name: 'img',
              element_data: image.image.id
            });
            $scope.resetImage();
            $scope.progressStatus = false;
          });
        };
        $scope.resetImage = function(){
          $scope.imageFileSrc = null;
          $('.imageFile').val('');
        };
      }
    };
  }]);
