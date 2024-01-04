import 'package:authenticationproject/Routes/routes_name.dart';
import 'package:authenticationproject/pages/Categories/subcategory.dart';
import 'package:authenticationproject/pages/Home/Homepage.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,
        title: const Center(child: AppBarTitle(title: 'Cart')),
        leading: const AppbarBackButton(),
        actions: const [
          Icon(Icons.shopping_cart),
        ],
        
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Center(child: Text('Your Cart is Empty', style: TextStyle(fontSize: 28),)),
       SizedBox(
         height: MediaQuery.sizeOf(context).height* 0.03,
       ),
        Material(

          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(25),

          child: MaterialButton(
            minWidth: MediaQuery.sizeOf(context).width * 0.6,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
               return const CustomerHomeScreen();
              }));
            },

    child: const Text(
      'Continue Shopping'
          , style: TextStyle(fontSize: 18, color:  Colors.white),
    ),
          ),

          //
        ),



        ],
      ),

      bottomSheet:  Padding(


        padding: const EdgeInsets.all(8.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Row(
              children: [
                Text('Total: \$ ', style: TextStyle(fontSize: 20),),
                Text('0:00', style: TextStyle(fontSize: 20, color: Colors.red),),
              ],
            ),


         Container(
           height: MediaQuery.sizeOf(context).height * 0.05,
           width: MediaQuery.sizeOf(context).width * 0.3,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.yellow,

        ),
        child: const Center(
          child: Text(
            'Checkout', style: TextStyle(fontSize: 18, ),
          ),
        ),
         )
          ],
        ),
      ),
    );
  }
}
