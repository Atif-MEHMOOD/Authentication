
import 'package:authenticationproject/Utils/categ_list.dart';
import 'package:authenticationproject/Widgets/catergory_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAndGardenCategory extends StatefulWidget {
  const HomeAndGardenCategory({super.key});

  @override
  State<HomeAndGardenCategory> createState() => _HomeAndGardenCategoryState();
}

class _HomeAndGardenCategoryState extends State<HomeAndGardenCategory> {
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
                  const CategoryHeaderLabel( categoryHeaderName: 'Home Category',),
                  SizedBox(height: MediaQuery.of(context).size.height *0.68,
                      child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        children: List.generate(homeandgarden.length, (index)  {
                          return SubCategoryModel(subCategoryImage: 'lib/images/homegarden/home$index.jpg',
                            mainCategoryName: 'home And Garden',
                            subCategoryName: homeandgarden[index],
                            subCategoryLabel: homeandgarden[index],);



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
            child: SliderBar( categoryNameOfSlider: 'Home And Garden',),

          ),

        ],

      ),
    );
  }
}
