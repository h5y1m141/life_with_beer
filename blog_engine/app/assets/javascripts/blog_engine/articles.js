window.onload = function() {
  var articleModel = new ArticleModel();
  var articlesView = new Vue({
    el: '#articles-view',
    data: {
      articles: [],
      newArticle: false,
      loading: false,
      message: '送信中です',
      title: '',
      body: '',
      showArticle: false,
      showItem: {}
    },
    beforeMount: function () {
      var that = this;
      articleModel.index();
      articleModel.deferred.done(function(response) {
        that.articles = response.articles;
      });
    },
    methods: {
      create: function () {
        this.loading = !this.loading;
        var that = this,
            data = { title: that.title, body: that.body };
        articleModel.create(data);
        articleModel.deferred.done(function(response) {
          if (that.title === response.title && that.body === response.body){
            that.message = '登録しました';
            that.articles.push({ id: response.id, title: response.title, body: response.body });
          } else {
            that.message = '正しく登録できませんでした';
          }
          that.new = false;
          that.title = '';
          that.body = '';
        });
      },
      show: function (articleId) {
        var that = this,
            data = { id: articleId };
        if(that.showArticle) that.showArticle = false;
        articleModel.show(data);
        articleModel.deferred.done(function(response) {
          that.showItem['title'] = response.article.title;
          that.showItem['body'] = response.article.body;
          that.showArticle = !that.showArticle;
        });
      }
    }
  });
};
