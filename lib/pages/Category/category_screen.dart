import 'package:authenticationproject/Utils/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

List<ItemData> item = [
  ItemData(label: "Men"),
  ItemData(label: ' Women'),
  ItemData(label: 'Shoes'),
  ItemData(label: 'Bags'),
  ItemData(label: 'Electronics'),
  ItemData(label: 'accessories'),
  ItemData(label: 'Home & Garden'),
  ItemData(label: 'Kids'),
  ItemData(label: 'Beauty'),

];
class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}


class _CategoryState extends State<Category> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Search_bar(),
        
        
      ),
      body:  Stack(
        children: [

            Positioned(
            bottom: 0,
              left: 0,
              child: Sidebare(size),
            ),

          Positioned(
            bottom: 0,
            right: 0,
            child: CategoryBody(size),
          )
          
        ],
      ),


    );

  }
  Widget Sidebare( size){


    return Container(
        color: Colors.grey.shade300,
        height: size.height * 0.8,
        width: size.width * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.vertical,


          itemCount: item.length,
          itemBuilder: ( context, index )   {
          return  SizedBox(
              height: 100,
            child: Text(item[index].label),
          );
        },
        )
    );
  }
  Widget CategoryBody( size){
    return Container(
      color: Colors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
    );
  }

}

class ItemData {
String label;
bool isSelected;

ItemData({required this.label, this.isSelected = false});
}


