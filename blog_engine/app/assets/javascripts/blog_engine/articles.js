window.onload = function() {
  var articleModel = new ArticleModel();
  var articlesView = new Vue({
    el: '#articles-view',
    data: {
      articles: [],
      newArticleSection: false,
      loading: false,
      message: '送信中です',
      newArticle: [],
      title: '',
      body: '',
      articleSection: false,
      article: {},
      editArticleSection: false
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
            data = { title: that.newArticle.title, body: that.newArticle.body };
        articleModel.create(data);
        articleModel.deferred.done(function(response) {
          if (that.newArticle.title === response.title && that.newArticle.body === response.body){
            that.message = '登録しました';
            that.articles.push({ id: response.id, title: response.title, body: response.body });
          } else {
            that.message = '正しく登録できませんでした';
          }
          that.newArticleSection = false;
          that.newArticle = [];
        });
      },
      show: function (articleId) {
        var that = this,
            data = { id: articleId };
        this.editArticleSection = false;
        if(that.articleSection) that.articleSection = false;
        articleModel.show(data);
        articleModel.deferred.done(function(response) {
          that.article.id = response.article.id;
          that.article.title = response.article.title;
          that.article.body = response.article.body;
          that.articleSection = true;
          // Need to set for update method
          that.title = response.article.title;
          that.body = response.article.body;
        });
      },
      edit: function () {
        this.articleSection = false;
        this.editArticleSection = true;
      },
      update: function (articleId) {
        var that = this,
            data = { id: articleId, title: that.title, body: that.body };
        articleModel.update(data);
        articleModel.deferred.done(function(response) {
          that.loading = !that.loading;
          if (that.title === response.title && that.body === response.body){
            that.message = '更新しました';
            that.editArticleSection = false;
            that.articles.filter(function(item, index){
              if (item.id === articleId) {
                that.articles[index].title = response.title;
                that.articles[index].body = response.body;
              }
            });
          } else {
            that.message = '正しく更新できませんでした';
          }
        });
      },
      destroy: function (articleId) {
        var that = this,
            data = { id: articleId };
        articleModel.destroy(data);
        articleModel.deferred.done(function(response) {
          that.loading = true;
          if (response.success) {
            that.message = '削除しました';
            that.articles.filter(function(item, index){
              if (item.id === articleId) that.articles.splice(index, 1);
            });
          } else {
            that.message = '正しく削除できませんでした';
          }
          that.articleSection = false;
        });
      }
    }
  });
};
