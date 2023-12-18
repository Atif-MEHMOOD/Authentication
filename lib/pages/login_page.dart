import 'package:authenticationproject/Data/Firebase_Authentications/firebase_aut-_service.dart';
import 'package:authenticationproject/user_model.dart';
import 'package:authenticationproject/view_model/auth_view_model.dart';
import 'package:authenticationproject/view_model/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authenticationproject/Utils/Utils.dart';
import 'package:authenticationproject/components/my_button.dart';
import 'package:authenticationproject/components/my_textfield.dart';
import 'package:authenticationproject/components/square_tile.dart';
import 'package:provider/provider.dart';

import '../Routes/route.dart';
import '../Routes/routes_name.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  final _formKey = GlobalKey<FormState>();
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode() ;


  ValueNotifier<bool> obsecurepasword = ValueNotifier<bool>(true);


  @override
  void initState() {
    super.initState();
    obsecurepasword = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailfocus.dispose();
    passwordfocus.dispose();
    obsecurepasword.dispose();
    super.dispose();
  }

  final FireBaseAuthService _auth = FireBaseAuthService();
  void Login(BuildContext context, email, password) async {

    UserViewModel checkuser= UserViewModel();

    // Show the circular loading indicator
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    User? user = await _auth.SigninWithEmailAndPassword(email, password, context);

    // Close the loading indicator
    Navigator.of(context).pop();

    if (user != null) {

      Navigator.pushNamed(context, RouteName.MyHomePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authview= Provider.of<AuthViewModel>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

             child: Column(

               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(height: screenSize.height * 0.05),


                 // logo
                 const Icon(
                   Icons.lock,
                   size: 100,
                 ),

                 SizedBox(height: screenSize.height * 0.05),

                 // welcome back, you've been missed!
                 Text(
                   'Welcome back you\'ve been missed!',
                   style: TextStyle(
                     color: Colors.grey[700],
                     fontSize: 16,
                   ),
                 ),

                 SizedBox(height: screenSize.height * 0.1),

                 // username textfield
                 MyTextField(
                   controller: usernameController,
                   hintText: 'Username',
                focus: emailfocus,
                   obscureText: false,
      onSubmitted: (value){
      Utils.FieldFocusChange(context, emailfocus, passwordfocus);
            },
                   autofocus: false,
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter your username';
                     }
                     return null;
                   },


                 ),


                 SizedBox(height: screenSize.height * 0.02),

                 ValueListenableBuilder(valueListenable: obsecurepasword, builder: (context, value, child){
                   return  MyTextField(
                     controller: passwordController,
                     hintText: 'Password',
                     obscureText: obsecurepasword.value,
            focus: passwordfocus,
                     icon: InkWell(
                       onTap: () {
                         // Toggle the visibility of the password
                         obsecurepasword.value = !obsecurepasword.value;
                       },
                       child: Icon(
                         obsecurepasword.value
                             ? Icons.visibility_off_outlined
                             : Icons.visibility,
                       ),


                     ),
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your password';
                       }
                       return null;
                     },
                   );
                 }

                 ),

                 // password textfield


                 SizedBox(height: screenSize.height * 0.02),

                 // forgot password?
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text(
                         'Forgot Password?',
                         style: TextStyle(color: Colors.grey[600]),
                       ),
                     ],
                   ),
                 ),

                 SizedBox(height: screenSize.height * 0.02),

                 // sign in button
                 MyButton(
                   text: 'Sign In',
    onTap: () {
      if (_formKey.currentState?.validate() ?? false) {


       Map data={
         "email": usernameController.text,
         "password":  passwordController.text,
             };
       final email= usernameController.text.trim();
       final password= passwordController.text.trim();
       Login(context,email, password);
        // authview.loginapi(data, context);


      }
    }
                 ),

                 SizedBox(height: screenSize.height * 0.02),

                 // or continue with
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Row(
                     children: [
                       Expanded(
                         child: Divider(
                           thickness: 0.5,
                           color: Colors.grey[400],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                         child: Text(
                           'Or continue with',
                           style: TextStyle(color: Colors.grey[700]),
                         ),
                       ),
                       Expanded(
                         child: Divider(
                           thickness: 0.5,
                           color: Colors.grey[400],
                         ),
                       ),
                     ],
                   ),
                 ),

                 SizedBox(height: screenSize.height * 0.02),

                 // google + apple sign in buttons
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: const [
                     // google button
                     SquareTile(imagePath: 'lib/images/google.png'),

                     SizedBox(width: 25),

                     // apple button
                     SquareTile(imagePath: 'lib/images/apple.png')
                   ],
                 ),

                 SizedBox(height: screenSize.height * 0.02),

                 // not a member? register now
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Not a member?',
                       style: TextStyle(color: Colors.grey[700]),
                     ),
                     const SizedBox(width: 4),
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, RouteName.register);
                       },
                       child: const Text(
                         'Register now',
                         style: TextStyle(
                           color: Colors.blue,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ],
                 )
               ],
             ),
                ),
          ),
        ),
      ),
    );
  }

}



