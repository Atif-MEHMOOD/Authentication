import 'package:authenticationproject/Data/App_Exceptions/App_Exceptions.dart';
import 'package:authenticationproject/Utils/Utils.dart';
import 'package:authenticationproject/user_model.dart';
import 'package:authenticationproject/view_model/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
class FireBaseAuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserViewModel checkuser= UserViewModel();
  Future<User?> signupwithemailandpassword(String email, String password, BuildContext context) async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    Utils.snackbar('Register Successful', context);
      return credential.user;
    } on FirebaseAuthException catch (e){
      if(e.code =='email-already-in-use'){
Utils.snackbar('email is already in use',context);
      }
      else if (e.code=='weak-password'){
        Utils.snackbar('Please add a strong password', context);
      }
    }


      return null;
    }


  Future<User?> SigninWithEmailAndPassword(String email, String password, BuildContext context) async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      checkuser.saveUser(UserModel(token: credential.user?.uid.toString()));
      Utils.snackbar('Login Successfull', context);
      return credential.user;
    }
    on FirebaseAuthException catch (e){
      if(e.code=='invalid-credential'){
        Utils.snackbar('Invalid Email or Password', context);
      }
     else if (e.code=='too-many-requests'){

        Utils.snackbar('you have too many login attempt please wait for  10 minutes ', context);
      }
     else if (e.code=='invalid-email'){
        Utils.snackbar('Email is invalid', context);
      }


    }


    
  }

  }



