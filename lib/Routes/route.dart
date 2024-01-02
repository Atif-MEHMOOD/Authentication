import 'package:authenticationproject/pages/Categories/subcategory.dart';
import 'package:authenticationproject/pages/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:authenticationproject/pages/Register_screen.dart';
import 'package:authenticationproject/pages/splash_screen.dart';

import '../pages/Home/search_screen.dart';
import '../pages/login_page.dart';
import 'routes_name.dart';

class Routes {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    case RouteName.splashscreen:
    return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (BuildContext context) =>  const RegisterScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginPage());
      case RouteName.MyHomePage:
        return MaterialPageRoute(builder: (BuildContext context) => const CustomerHomeScreen());
      case RouteName.SearchScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const  SearchScreen());








      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routes'),
            ),
          );
        });
    }
  }
}


