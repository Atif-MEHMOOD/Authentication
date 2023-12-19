import 'package:authenticationproject/Routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../Utils/search_bar.dart';
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

      length: 9,
      child: Scaffold(
        appBar: AppBar(

          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Search_bar(),
          bottom: const TabBar(

            isScrollable: true,

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

