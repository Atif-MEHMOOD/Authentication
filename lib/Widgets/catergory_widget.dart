
import 'package:authenticationproject/pages/Categories/subcategory.dart';
import 'package:flutter/material.dart';

class SliderBar extends StatelessWidget {
  final String categoryNameOfSlider;
  const SliderBar({
    super.key, required this.categoryNameOfSlider,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(   height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.05,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.2),

                borderRadius: BorderRadius.circular(20),

              ),
              child: RotatedBox(
                quarterTurns: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('<<', style: TextStyle(
                      fontSize: 16,
                      color:Colors.brown,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),),
                    Text(categoryNameOfSlider.toUpperCase(), style: const TextStyle(
                      fontSize: 16,
                      color:Colors.brown,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),),
                    const Text('>>', style: TextStyle(
                      fontSize: 16,
                      color:Colors.brown,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),)
                  ],
                ),

              )
          ),
        )
    );
  }
}

class SubCategoryModel extends StatelessWidget {
  String subCategoryImage;
  String subCategoryName;
  String mainCategoryName = "";
  String subCategoryLabel;
  SubCategoryModel({



    super.key, required this.subCategoryImage, required this.subCategoryName, required mainCategoryName, required this.subCategoryLabel
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [


          SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width  * 0.15,

              child: Image(image: AssetImage(subCategoryImage))),

          Text(subCategoryLabel)


        ],



      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Subcategory(categoryName: subCategoryName, subcategoryName: mainCategoryName, )));
      },
    );
  }
}

class CategoryHeaderLabel extends StatelessWidget {
  final String categoryHeaderName;

  const CategoryHeaderLabel({

    required this.categoryHeaderName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(categoryHeaderName, style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600, wordSpacing: 1.5),),
    );
  }
}
