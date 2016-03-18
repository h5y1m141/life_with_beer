//= require admin/app
//= require admin/controllers/article

describe('ArticleCtrl', function () {
  var ctrl,
      scope;

  beforeEach(module('LifeWithBeerApp'));
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ctrl = $controller('ArticleCtrl', {
      $scope: scope
    });
  }));
  describe('設定したscopeについて', function () {
    it('タブとして定義してる先頭のタイトル名が取得できる', function () {
      expect(scope.tabs[0].title).toBe('記事の基本情報');
    });
  });
});
