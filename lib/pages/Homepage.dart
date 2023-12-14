// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
//
//
//
// class MyHomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beautiful Home Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Animated text
//             TyperAnimatedTextKit(
//               speed: Duration(milliseconds: 200),
//               isRepeatingAnimation: false,
//               text: ['Welcome Punisher, you have made it'],
//               textStyle: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             // Customized button
//             ElevatedButton(
//               onPressed: () {
//
//                 print('Sign Out button pressed');
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                 primary: Colors.red, // Choose your button color
//               ),
//               child: Text(
//                 'Sign Out',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:authenticationproject/Routes/routes_name.dart';
import 'package:authenticationproject/user_model.dart';
import 'package:authenticationproject/view_model/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Beautiful Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated text
            TyperAnimatedTextKit(
              speed: Duration(milliseconds: 200),
              isRepeatingAnimation: false,
              text: ['Welcome Punisher, you have made it'],
              textStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Customized button
            ElevatedButton(
              onPressed: () async{

                 await userViewModel.clearUser();

                Navigator.pushNamed(context, RouteName.login);
                print('Sign Out button pressed');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                primary: Colors.red, // Choose your button color
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
