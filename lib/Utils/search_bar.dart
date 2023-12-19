import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Routes/routes_name.dart';

class Search_bar extends StatelessWidget {
  const Search_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteName.SearchScreen);
      },

      child: Container(
        height: 35,



        decoration:  BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 1.4),
            borderRadius: BorderRadius.circular(25)

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search , color: Colors.grey,),
                ),
                Text('What are you looking for?', style: TextStyle(fontSize: 18, color: Colors.grey),),
              ],
            ),


            Container(
              height: 32,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.yellow
              ),
              child: const Center(
                child: Text(
                    'Search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
              ),)


          ],

        ),
      ),
    );
  }
}