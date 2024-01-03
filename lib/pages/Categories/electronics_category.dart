
import 'package:authenticationproject/Utils/categ_list.dart';
import 'package:authenticationproject/Widgets/catergory_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElectronicsCategory extends StatefulWidget {
  const ElectronicsCategory({super.key});

  @override
  State<ElectronicsCategory> createState() => _ElectronicsCategoryState();
}

class _ElectronicsCategoryState extends State<ElectronicsCategory> {
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
                  const CategoryHeaderLabel( categoryHeaderName: 'Electronics Category',),
                  SizedBox(height: MediaQuery.of(context).size.height *0.68,
                      child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        children: List.generate(electronics.length, (index)  {
                          return SubCategoryModel(subCategoryImage: 'lib/images/electronics/electronics$index.jpg',
                            mainCategoryName: 'Electronics',
                            subCategoryName: electronics[index],
                            subCategoryLabel: electronics[index],);



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
            child: SliderBar( categoryNameOfSlider: 'Electronics',),

          ),

        ],

      ),
    );
  }
}
