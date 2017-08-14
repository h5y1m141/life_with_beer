window.onload = function() {
  var articleModel = new ArticleModel();
  var articlesView = new Vue({
    el: '#articles-view',
    data: {
      articles: [],
      show: false,
      loading: false,
      message: '送信中です',
      title: '',
      body: ''
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
          that.show = false;
          that.title = '';
          that.body = '';
        });
      }
    }
  });

  articlesView.$on('updatedArticles', function () {
    this.updateArticles();
  });

};
