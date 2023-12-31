import 'package:authenticationproject/pages/Cart/cart_screen.dart';
import 'package:authenticationproject/pages/Home/home_view.dart';
import 'package:authenticationproject/pages/Profile/profile_screen.dart';
import 'package:authenticationproject/pages/Stores/store_main_screen.dart';
import 'package:flutter/material.dart';

import '../Search_Category/category_screen.dart';


class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _Seletedindex=0;
  final List<Widget> _tabs=[
   const Homeview(),
   const Category(),
   const Stores(),
    const Cart(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _tabs[_Seletedindex],
      bottomNavigationBar: BottomNavigationBar(

        elevation: 0,

        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),

        currentIndex: _Seletedindex,
        selectedItemColor: Colors.black,

        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index){
          setState(() {
            _Seletedindex=index;
          });
        },
      ),
    );
  }
}
