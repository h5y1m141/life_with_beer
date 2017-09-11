$(function () {
  var store = new Vuex.Store({
    state: {
      message: ''
    },
    mutations: {
      updateMessage (state, message) {
        state.message = message;
      }
    }
  });

  var articleView = new Vue({
    el: '#article-view',
    computed: {
      message () {
        // console.log(marked('I am using __markdown__.'));
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
