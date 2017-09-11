Vue.component('product-list',{
  template:'#product-list-template',
  props: {
    products: Array
  },
  created: function(){
    // this.$store.dispatch('getAllProducts')
  },
  methods: {
    // vuexではActionに定義
    addToCart: function(product){
      this.$emit('add-to-cart', product);
    }
  }
});
