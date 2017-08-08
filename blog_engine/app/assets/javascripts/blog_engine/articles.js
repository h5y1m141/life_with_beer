window.onload = function() {
  var articleViewModel = new Vue({
    el: '#article-form',
    data: {
      show: false,
      loading: false,
      message: '送信中です',
      title: '',
      body: ''
    },
    methods: {
      create: function () {
        this.loading = !this.loading;
        var that = this,
            hostname = window.location.hostname,
            protocol = window.location.protocol,
            port =  window.location.port,
            baseURL = [protocol,'//', hostname,':', port, '/blog/articles'].join('');

        var params = {
          url: baseURL,
          method: 'POST',
          data: { title: that.title, body: that.body }
        }
        $.ajax(params).done(function(response){
          that.message = '送信完了しました';
          that.show = false;
        });
      }
    }
  })
}
