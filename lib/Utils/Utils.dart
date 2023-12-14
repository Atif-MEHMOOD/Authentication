
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils{


  static FieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();

      FocusScope.of(context).requestFocus(nextFocus);
    }


  // static void ToastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.amberAccent,
  //     fontSize: 16.0,
  //     gravity: ToastGravity.BOTTOM,
  //     toastLength: Toast.LENGTH_SHORT,
  //     timeInSecForIosWeb: 1,
  //
  //     // Add more customization options as needed
  //   );
  // }
  static ToastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.black,


      textColor: Colors.amberAccent,


    );
  }
  static void  FlushbarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(message: message,

      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.all(15),
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.bounceIn,
      forwardAnimationCurve: Curves.decelerate,
    duration: const Duration(seconds: 20),
    flushbarPosition: FlushbarPosition.TOP,
    positionOffset: 20,
    icon: const Icon(Icons.error, size: 28, color: Colors.blue,),
    )..show(context));
  }

  static snackbar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
    duration: Duration(seconds: 3),
      backgroundColor: Colors.red,


    ));
  }
  static bool validateInputs(String username, String password) {
    if (username.isEmpty) {
      Utils.ToastMessage('Username is empty');

    }

    // Check if password is not empty and meets certain criteria
    if (password.isEmpty || password.length < 6) {
      Utils.ToastMessage('Invalid password. It should not be empty and its length should be at least 6 characters.');
      return false;
    }

    return true;
  }

}