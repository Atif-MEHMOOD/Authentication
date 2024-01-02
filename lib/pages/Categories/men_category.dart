import 'package:authenticationproject/Routes/routes_name.dart';
import 'package:authenticationproject/Utils/categ_list.dart';
import 'package:authenticationproject/pages/Categories/subcategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenCategory extends StatefulWidget {
  const MenCategory({super.key});

  @override
  State<MenCategory> createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
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
                  const CategoryHeaderLabel( categoryHeaderName: 'Men Category',),
                  SizedBox(height: MediaQuery.of(context).size.height *0.68,
                      child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        children: List.generate(men.length, (index)  {
                          return SubCategoryModel(subCategoryImage: 'lib/images/men/men$index.jpg', mainCategoryName: 'men', subCategoryName: men[index], subCategoryLabel: men[index],);



                        }
                        ),


                      )


                  )
                ],

              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(   height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.05,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.2),

                        borderRadius: BorderRadius.circular(20),

                      ),
                      child:const RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('<<', style: TextStyle(
                              fontSize: 16,
                              color:Colors.brown,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 10,
                            ),),
                            Text('MEN', style: TextStyle(
                              fontSize: 16,
                              color:Colors.brown,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 10,
                            ),),
                            Text('>>', style: TextStyle(
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
            ),

          ),

        ],

      ),
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
