
import 'package:authenticationproject/Utils/categ_list.dart';
import 'package:authenticationproject/Widgets/catergory_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoesCategory extends StatefulWidget {
  const ShoesCategory({super.key});

  @override
  State<ShoesCategory> createState() => _ShoesCategoryCategoryState();
}

class _ShoesCategoryCategoryState extends State<ShoesCategory> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(

        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width:  MediaQuery.of(context).size.width * 0.78,
              child: Column(

                children: [
                  const CategoryHeaderLabel( categoryHeaderName: 'Shoes Category',),
                  SizedBox(height: MediaQuery.of(context).size.height *0.68,
                      child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        children: List.generate(shoes.length, (index)  {

                          return SubCategoryModel(subCategoryImage: 'lib/images/shoes/shoes$index.jpg',
                            mainCategoryName: 'Shoes', subCategoryName: shoes[index],
                            subCategoryLabel: shoes[index],);



                        }
                        ),


                      )


                  )
                ],

              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar( categoryNameOfSlider: 'Shoes',),

          ),

        ],

      ),
    );
  }
}
