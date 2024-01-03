import 'package:flutter/material.dart';

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