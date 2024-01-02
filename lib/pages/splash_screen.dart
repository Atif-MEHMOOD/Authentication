// import 'dart:async';
// import 'package:authenticationproject/Services/splash_services.dart';
// import 'package:flutter/material.dart';
// import '../Routes/routes_name.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//  late AnimationController _controller;
//   SplashServices _splashServices = SplashServices();
//   @override
//   void initState() {
//     _splashServices.CheckAuthentications(context);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double scale = MediaQuery.of(context).size.width > 600 ? 3.0 : 2.0;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Animated Flutter Logo
//             AnimatedFlutterLogo(controller: _controller, scale: scale),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//             Text(
//               'Welcome Punisher',
//               style: TextStyle(
//                 fontSize: 40,
//                 foreground: Paint()
//                   ..style = PaintingStyle.stroke
//                   ..strokeWidth = 2
//                   ..color = Colors.blue[700]!,
//               ),
//             ),
//
//           ],
//
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
// class AnimatedFlutterLogo extends StatelessWidget {
//   final double scale;
//   final AnimationController controller;
//
//   AnimatedFlutterLogo({required this.scale, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return RotationTransition(
//       turns: controller,
//       child: Center(
//         child: Transform.scale(
//           scale: scale,
//           child: Image(
//             image: AssetImage('lib/images/logo.png'),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:authenticationproject/Services/splash_services.dart';
import 'package:flutter/material.dart';
import '../Routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SplashServices _splashServices;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _splashServices = SplashServices();
    _splashServices.CheckAuthentications(context);
  }

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width > 600 ? 3.0 : 2.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Flutter Logo
            AnimatedFlutterLogo(controller: _controller, scale: scale),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              'Welcome Punisher',
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.blue[700]!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedFlutterLogo extends StatelessWidget {
  final double scale;
  final AnimationController controller;

  AnimatedFlutterLogo({required this.scale, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: Center(
        child: Transform.scale(
          scale: scale,
          child: const Image(
            image: AssetImage('lib/images/component_image/logo.png'),
          ),
        ),
      ),
    );
  }
}
