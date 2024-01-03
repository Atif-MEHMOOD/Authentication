import 'package:authenticationproject/Routes/routes_name.dart';
import 'package:authenticationproject/Utils/categ_list.dart';
import 'package:authenticationproject/Widgets/catergory_widget.dart';
import 'package:authenticationproject/pages/Categories/subcategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KidsCategory extends StatefulWidget {
  const KidsCategory({super.key});

  @override
  State<KidsCategory> createState() => _KidsCategoryState();
}

class _KidsCategoryState extends State<KidsCategory> {
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
                  const CategoryHeaderLabel( categoryHeaderName: 'Bags Category',),
                  SizedBox(height: MediaQuery.of(context).size.height *0.68,
                      child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        children: List.generate(kids.length, (index)  {
                          return SubCategoryModel(subCategoryImage: 'lib/images/kids/kids$index.jpg',
                            mainCategoryName: 'Kids',
                            subCategoryName: kids[index],
                            subCategoryLabel: kids[index],);



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
            child: SliderBar( categoryNameOfSlider: 'Kids',),

          ),

        ],

      ),
    );
  }
}
