import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Cart.dart';
List<Cart> cartList=[];
class CartNotifier extends StateNotifier<List<Cart>>{
  CartNotifier():super([]);

  void addToCart(Cart  c){
    bool val=false;
    if(cartList.isEmpty){
      cartList.insert(0, c);
    }
    //if cart has the same item : dont add again
    else {
      for (int i = 0; i < cartList.length; i++) {
        if (cartList[i].img == c.img && cartList[i].amt == c.amt) {
         val=true;
        }
      }
      if(val!=true){
        cartList.insert(0, c);
      }
    }
  }
}
