//= require admin/app
//= require admin/directives/preview-place

describe('directives:preview-place', function () {
  var $compile,
      $rootScope;
  beforeEach(module('LifeWithBeerApp'));
  beforeEach(inject(function(_$compile_, _$rootScope_){
    $compile = _$compile_;
    $rootScope = _$rootScope_.$new();
    $rootScope.content = {};
    $rootScope.content.name = 'お店の名前';
  }));
  it('HTMLの要素が置き換わる', function () {
    var element = $compile('<preview-place data="content"></preview-place>')($rootScope);
    $rootScope.$digest();
    expect(element.html()).toContain('お店の名前');
  });
});
