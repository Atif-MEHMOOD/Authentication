import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return  DefaultTabController(

      length: 10,
      child: Scaffold(
        appBar: AppBar(

          elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
            height: 35,
           

            decoration:  BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 1.4),
borderRadius: BorderRadius.circular(25)

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search , color: Colors.grey,),
                Text('What are you looking for?', style: TextStyle(fontSize: 16, color: Colors.grey),),

              Container(
                height: 32,
                width: 75,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.yellow
              ),
              child: Center(
                child: const Text(
                  'Search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),)
              ],

            ),
          ),
          bottom: const TabBar(

            isScrollable: true,
            physics: ScrollPhysics(),
            indicatorColor: Colors.yellow,
            indicatorWeight: 8.0,
            indicatorPadding: EdgeInsets.zero,
            tabs: [
              RepeatedTabs(label: 'Men',),
              RepeatedTabs(label: 'Women',),
              RepeatedTabs(label: 'Shoes',),
              RepeatedTabs(label: 'Bags',),
              RepeatedTabs(label: 'Electronics',),
              RepeatedTabs(label: 'Accessories',),
              RepeatedTabs(label: 'Home & Garden',),
              RepeatedTabs(label: 'Kids',),
              RepeatedTabs(label: 'Beauty',),




            ],

          ),

        ),
        body: const TabBarView(children: [
          Center(child: Text('Men')),
          Center(child: Text('Women')),
          Center(child: Text('Shoes')),
          Center(child: Text('Bags')),
          Center(child: Text('Electronics')),
          Center(child: Text('Accessories')),
          Center(child: Text('Home & Garden')),
          Center(child: Text('Kids')),
          Center(child: Text('Beauty')),
        ]),

      ),
    );
  }
}

class RepeatedTabs extends StatelessWidget {

  final String? label;
  const RepeatedTabs({
    @required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(label!, style: TextStyle(color: Colors.grey.shade600),) ,);
  }
}

