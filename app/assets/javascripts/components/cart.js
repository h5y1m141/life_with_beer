Vue.component('cart',{
  template:'#cart-template',
  props: {
    carts: Array
  },
  data: function () {
    return {
      carts: []
    };
  },
  computed: {
    total: function(){
      this.products.reduce(function(total, p){
        return total + p.price * p.quantity;
      },0);
    }
  },
  methods: {
    checkout: function(products){
      // this.$store.dispatch('checkout', products)
    }
  }
});
