import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Cart.dart';
import 'CartNotifier.dart';
class Add extends StatelessWidget {
Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"),automaticallyImplyLeading: false,),
      body:Container(
        child: ListView.builder(
          itemCount: cartList.length,
            itemBuilder:(BuildContext context,int index){
            Cart getCart=cartList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 300,width: 300,
                         color: Colors.black,
                          child: Image.asset(getCart.img,width: 200,height: 200,)
                      ),
                      SizedBox(height: 10,),
                      Text(getCart.amt,style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              );
            }),
      )
    );
  }
}
