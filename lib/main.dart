import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodex/Add.dart';
import 'package:riverpodex/CartNotifier.dart';
import 'Cart.dart';
final cartProvider=StateNotifierProvider<CartNotifier,List<Cart>>((ref)=>CartNotifier());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
   MyHomePage({Key? key}) : super(key: key);
  List<String> img=['img/1.png','img/2.png','img/3.png','img/4.png','img/5.png'];
   List<String> amt=['Rs.1000','Rs.1500','Rs.900','Rs.800','Rs.950'];
  @override
  Widget build(BuildContext context,WidgetRef ref) {
     return Scaffold(
        appBar: AppBar(
          title: Text("Riverpod"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: img.length,
                  itemBuilder: (BuildContext context,int index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     color: Colors.grey,
                     height:250,width:250,
                     child: Row(
                       children: [
                         Column(
                           children: [
                             Image.asset(img[index],height: 200,width: 200,),
                             OutlinedButton(
                                 onPressed:(){},child: Text(amt[index],style:TextStyle(color: Colors.black) ,),
                             ),
                           ],
                         ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                              ElevatedButton(onPressed: (){
                                showDialog(context: context,
                                    builder: (_){
                                  return AlertDialog(
                                    backgroundColor: Colors.black,
                                    content: Container(
                                      height:300,
                                        width: 300,
                                        child: Image.asset(img[index],height: 200,width: 200,)),
                                  );
                                    });
                              },
                                  child: Text("View")),
                             ElevatedButton(onPressed:(){

                               final c=ref.read(cartProvider.notifier) }, child: Text("Add to Cart"))
                           ],
                         )
                       ]
                   ),
                 )
                 );

              }),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

