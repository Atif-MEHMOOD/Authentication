import 'dart:developer';

import 'package:authenticationproject/Utils/Utils.dart';
import 'package:authenticationproject/repository/AuthRepository.dart';
import 'package:authenticationproject/user_model.dart';
import 'package:authenticationproject/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel with ChangeNotifier{
  UserViewModel user= UserViewModel();
  final _myRepo = AuthRepository();
  Future<void> loginapi(dynamic data, BuildContext context) async{
    _myRepo.loginApi(data).then((value){

      String? token = value['token'];
      user.saveUser(UserModel(token: token));
      user.getUser();
      Utils.FlushbarErrorMessage('loggin successfull ', context);
      if(kDebugMode){
        print(value.toString());
      }


    }).onError((error, stackTrace) {

Utils.FlushbarErrorMessage(error.toString(), context);
    });

  }

  Future<void> SignupApi(dynamic data, BuildContext context) async{
    _myRepo.Registerapi(data).then((value){
      if(kDebugMode){
        print(value.toString());
      }


    }).onError((error, stackTrace) {
      Utils.snackbar(error.toString(), context);

    });

  }

}