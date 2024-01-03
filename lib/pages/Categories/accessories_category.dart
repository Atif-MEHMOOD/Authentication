
import 'package:authenticationproject/Utils/categ_list.dart';
import 'package:authenticationproject/Widgets/catergory_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccessoriesCategory extends StatefulWidget {
  const AccessoriesCategory({super.key});

  @override
  State<AccessoriesCategory> createState() => _AccessoriesCategoryState();
}

class _AccessoriesCategoryState extends State<AccessoriesCategory> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(

        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width:  MediaQuery.of(context).size.width * 0.75,
              child: Column(

                children: [
                  const CategoryHeaderLabel( categoryHeaderName: 'Accessories Category',),
                  SizedBox(height: MediaQuery.of(context).size.height *0.68,
                      child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        children: List.generate(accessories.length, (index)  {
                          return SubCategoryModel(subCategoryImage: 'lib/images/accessories/accessories$index.jpg',
                            mainCategoryName: 'Accessories',
                            subCategoryName: accessories[index],
                            subCategoryLabel: accessories[index],);



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
            child: SliderBar( categoryNameOfSlider: 'Accessories',),

          ),

        ],

      ),
    );
  }
}
