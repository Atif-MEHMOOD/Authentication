import 'package:flutter/material.dart';

class Subcategory extends StatelessWidget {
  final subcategoryName;
  final categoryName;


   Subcategory({required this.categoryName, required this.subcategoryName ,super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(

        title: Text('$categoryName'),
      ),
      body: Center(
        child: Text('$subcategoryName'),
      ),

    );
  }
}
