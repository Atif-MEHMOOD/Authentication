import 'package:authenticationproject/Utils/search_bar.dart';
import 'package:authenticationproject/pages/Categories/men_category.dart';
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
  void initState() {
    for(var a in item){
      a.isSelected=false;
    }


    // setState(() {

      item[0].isSelected=true;
    // });
    // TODO: implement initState
    super.initState();
  }

final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

backgroundColor: Colors.white,

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


    return SingleChildScrollView(
      child: GestureDetector(

        child: SizedBox(

            height: size.height * 0.80,
            width: size.width * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.vertical,


              itemCount: item.length,
              itemBuilder: ( context, index )   {

              return  GestureDetector(
                  onTap: (){
                  _controller.animateToPage(index, duration: Duration(microseconds: 100,), curve: Curves.bounceInOut);
                  },
                  child: Container(

                    color: item[index].isSelected == true ? Colors.white : Colors.grey.shade300,
                  height: 100,

                  child: Center(child: Text(item[index].label))));

            },

            )
        ),
      ),
    );
  }



  Widget CategoryBody( size){
    return Container(
      color: Colors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        onPageChanged: (index) {
          for(var a in item){
            a.isSelected=false;
          }


          setState(() {
            _controller.animateToPage(
              index,

              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut,

            );
            item[index].isSelected=true;
          });
        },




children: const[

  MenCategory(),
      Center(child: Text('Women')),
      Center(child: Text('Shoes')),
      Center(child: Text('Bags')),
      Center(child: Text('Electronics')),
    Center(child: Text('Accessories')),
   Center(child: Text('Home & Garden')),
   Center(child: Text('Kids')),
   Center(child: Text('Beauty')),

],

      )
    );

  }

}

class ItemData {
String label;
bool isSelected;

ItemData({required this.label, this.isSelected = false});
}


