import 'package:authenticationproject/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:authenticationproject/pages/Register_screen.dart';
import 'package:authenticationproject/pages/splash_screen.dart';

import '../pages/login_page.dart';
import 'routes_name.dart';

class Routes {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    case RouteName.splashscreen:
    return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
      case RouteName.MyHomePage:
        return MaterialPageRoute(builder: (BuildContext context) => MyHomePage());


      case RouteName.register:
        return MaterialPageRoute(builder: (BuildContext context) => RegisterScreen());



      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No Routes'),
            ),
          );
        });
    }
  }
}
