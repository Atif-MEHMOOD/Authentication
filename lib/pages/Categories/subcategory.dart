import 'package:flutter/material.dart';

class Subcategory extends StatelessWidget {
  final String subcategoryName;
  final String categoryName;


   const Subcategory({required this.categoryName, required this.subcategoryName ,super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(

        title: Center(child: AppBarTitle(title: categoryName)),
        leading:  const AppbarBackButton(),
      ),
      body: Center(
        child: Text(subcategoryName ,style: const TextStyle(fontFamily: 'Acme', color: Colors.black)),
      ),

    );
  }
}

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
    onPressed: (){
        Navigator.pop(context);

    }

    );
  }
}

class AppBarTitle extends StatelessWidget {
  final String title;
  const AppBarTitle({
    super.key,
    required this.title,
  });



  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(fontFamily: 'Acme', color: Colors.black, fontSize: 34), );
  }
}
