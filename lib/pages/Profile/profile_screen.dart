import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            automaticallyImplyLeading: false,

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    opacity: constraints.biggest.height <= 120 ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Text('Account'),

                  ),
                  background: Container(
                    decoration: const BoxDecoration(gradient: LinearGradient(colors: [ Color(0xFF3498db), // Light Blue
                      Color(0xFFe74c3c), // Red
                      Color(0xFFf39c12),])),
                  ),
                );
              },
            ),
          ),
         SliverToBoxAdapter(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                height:MediaQuery.sizeOf(context).height * 0.1,
                width: MediaQuery.sizeOf(context).width *0.9,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200)


                ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     height: MediaQuery.sizeOf(context).height * 0.08,
                     width: MediaQuery.sizeOf(context).width * 0.26,
                     decoration: const BoxDecoration(
                       color: Colors.black54,
                       borderRadius: BorderRadius.only( topLeft: Radius.circular(300.0),    // Set the radius for topLeft corner
                         bottomLeft: Radius.circular(300.0), )
                     ),
child: TextButton(onPressed: () {  }, child: const Text('Cart', style: TextStyle(color: Colors.yellow, fontSize: 26),),
  
),

                   ),
                   Container(
                     height: MediaQuery.sizeOf(context).height * 0.08,
                     width: MediaQuery.sizeOf(context).width * 0.26,
                     decoration: const BoxDecoration(
                         color: Colors.orange,
                        ),

                     child: TextButton(onPressed: () {  }, child: const Text('Order', style: TextStyle(color: Colors.black54, fontSize: 26, fontWeight: FontWeight.bold),),

                     ),

                   ),
                   Container(
                     height: MediaQuery.sizeOf(context).height * 0.08,
                     width: MediaQuery.sizeOf(context).width * 0.26,
                     decoration: const BoxDecoration(
                       color: Colors.black54,
                       borderRadius: BorderRadius.only(
                           topRight: Radius.circular(300.0),
                         bottomRight: Radius.circular(300.0)

                       )

                     ),

                     child: TextButton(onPressed: () {  }, child: const Text('Wishlist', style: TextStyle(color: Colors.yellow, fontSize: 22, fontWeight: FontWeight.bold),),

                     ),

                   ),

                 ],
               ),
             ),
              ),
             SizedBox(height: 100,),
              Column(
                children: [
                  Divider(
                    color: Colors.brown,
                    thickness: 1,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height *0.45,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}
