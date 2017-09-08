$(function () {
  const store = new Vuex.Store({
    state: {
      message: ''
    },
    mutations: {
      updateMessage (state, message) {
        state.message = message;
      }
    }
  });

  var app = new Vue({
    el: '#article-view',
    computed: {
      message () {
        return store.state.message;
      }
    },
    methods: {
      updateMessage: function (e) {
        store.commit('updateMessage', e.target.value);
      }
    }
  });
});
