import 'package:authenticationproject/pages/Categories/subcategory.dart';
import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppbarBackButton(),
        title: const Center(child: AppBarTitle(title: 'Stores',)),
      ),
    );
  }
}
