import 'package:authenticationproject/pages/Home/home_view.dart';
import 'package:flutter/material.dart';
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _Seletedindex=0;
  final List<Widget> _tabs=[
    Homeview(),
    Center(child: Text('Search')),
    Center(child: Text('Stores')),
    Center(child: Text('Cart')),
    Center(child: Text('Profile')),
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
