var ArticleModel = (function () {
  function ArticleModel() {
    var hostname = window.location.hostname,
        protocol = window.location.protocol,
        port = window.location.port;
    this.baseURL = [protocol, '//', hostname, ':', port, '/blog'].join('');
  }

  ArticleModel.prototype = {
    index : function () {
      var params = {
          url: this.baseURL + '/articles.json',
          type: "GET",
          action: "index"
      };
      return this._request(params);
    },
    create : function (data) {
      var params = {
          url: this.baseURL + '/articles',
          type: "POST",
          data: { title: data['title'], body: data['body'] },
          action: "create"
      };
      return this._request(params);
    },
    show : function (data) {
      var params = {
          url: this.baseURL + '/articles/' + data['id'] + '.json',
          type: "GET",
          data: data,
          action: "show"
      };
      return this._request(params);
    },
    _request : function (params) {
      this.deferred = $.ajax(params);
    }
  };
  return ArticleModel;
}());
