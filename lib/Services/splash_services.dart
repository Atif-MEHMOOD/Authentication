import 'package:authenticationproject/Routes/routes_name.dart';
import 'package:authenticationproject/user_model.dart';
import 'package:authenticationproject/view_model/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SplashServices{
  Future<UserModel> getdataofuser()=> UserViewModel().getUser();

  void CheckAuthentications(BuildContext context) async{
    getdataofuser().then((value) async {
      print(value.token);
      if(value.token==null || value.token==''){
await  Future.delayed(Duration(seconds: 4));
        Navigator.pushNamed(context, RouteName.login);
      }
      else{
        await  Future.delayed(Duration(seconds: 4));
        Navigator.pushNamed(context, RouteName.MyHomePage);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}