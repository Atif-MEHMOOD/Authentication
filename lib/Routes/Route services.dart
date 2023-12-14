// import 'package:authenticationproject/Routes/routes_name.dart';
// import 'package:authenticationproject/view_model/user_view_model.dart';
// import 'package:flutter/cupertino.dart';
//
// class CustomNavigatorObserver extends NavigatorObserver {
//   final UserViewModel userViewModel;
//
//   CustomNavigatorObserver(this.userViewModel);
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     // Check if the previous route is the splash screen
//     if (previousRoute?.settings.name == RouteName.splashscreen) {
//       // If yes, check user authentication state
//       if (userViewModel) {
//         // User is authenticated, navigate to the home page
//         route.navigator?.pushReplacementNamed(RouteName.MyHomePage);
//       }
//       else {
//         // User is not authenticated, navigate to the login page
//         route.navigator?.pushReplacementNamed(RouteName.login);
//       }
//     }
//   }
// }
