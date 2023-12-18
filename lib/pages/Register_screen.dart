import 'package:authenticationproject/Data/Firebase_Authentications/firebase_aut-_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authenticationproject/components/my_button.dart';
import 'package:authenticationproject/components/my_textfield.dart';

import '../Routes/route.dart';
import '../Routes/routes_name.dart';
import '../Utils/Utils.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {



  final _formKey = GlobalKey<FormState>();

  // text editing controllers
  final RegisterusernameController = TextEditingController();
  final RegisterpasswordController = TextEditingController();
  final  ConfirmRegisterpasswordController = TextEditingController();
  FocusNode Registeremailfocus = FocusNode();
  FocusNode Registerpasswordfocus = FocusNode();
  FocusNode ConfirmRegisterpasswordfocus = FocusNode();


  late ValueNotifier<bool> Registerobsecurepasword;
  late ValueNotifier<bool> ConfirmRegisterobsecurepassword;
  final FireBaseAuthService _auth = FireBaseAuthService();

  @override
  void initState() {
    super.initState();
    Registerobsecurepasword = ValueNotifier<bool>(true);
    ConfirmRegisterobsecurepassword = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    RegisterusernameController.dispose();
    RegisterpasswordController.dispose();
    ConfirmRegisterpasswordController.dispose();
    Registeremailfocus.dispose();
    Registerpasswordfocus.dispose();
    ConfirmRegisterpasswordfocus.dispose();
    Registerobsecurepasword.dispose();
    ConfirmRegisterobsecurepassword.dispose();
    super.dispose();
  }


  void Signup(BuildContext context) async {
    String email = RegisterusernameController.text.trim();
    String password = RegisterpasswordController.text.trim();

    // Show the circular loading indicator
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    User? user = await _auth.signupwithemailandpassword(email, password, context);

    // Close the loading indicator
    Navigator.of(context).pop();

    if (user != null) {
      Navigator.pushNamed(context, RouteName.login);
    }
  }



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SingleChildScrollView(

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: screenSize.height * 0.06),
                      // logo
                      const Icon(
                        Icons.lock_open_outlined,
                        size: 100,
                      ),

                      SizedBox(height: screenSize.height * 0.05),

                      // welcome back, you've been missed!
                      Text(
                        'Welcome \'Register Yourself here!',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: screenSize.height * 0.1),

                      // username textfield
                      MyTextField(
                        controller: RegisterusernameController,
                        hintText: 'Username',
                        focus: Registeremailfocus,
                        keyboardType: TextInputType.emailAddress,

                        obscureText: false,
                        onSubmitted: (value){
                          Utils.FieldFocusChange(context, Registeremailfocus, Registerpasswordfocus);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },


                      ),


                      SizedBox(height: screenSize.height * 0.02),

                      ValueListenableBuilder(valueListenable: Registerobsecurepasword, builder: (context, value, child){
                        return  MyTextField(
                          controller: RegisterpasswordController,
                          hintText: 'Password',
                          obscureText: Registerobsecurepasword.value,
                          focus: Registerpasswordfocus,


                          icon: InkWell(
                            onTap: () {
                              // Toggle the visibility of the password
                              Registerobsecurepasword.value = ! Registerobsecurepasword.value;
                            },
                            child: Icon(
                              Registerobsecurepasword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                            ),


                          ),
                          onSubmitted: (value){
                            Utils.FieldFocusChange(context, Registerpasswordfocus, ConfirmRegisterpasswordfocus);
                          },
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
                      ValueListenableBuilder(valueListenable: ConfirmRegisterobsecurepassword, builder: (context, value, child){
                        return  MyTextField(
                          controller: ConfirmRegisterpasswordController,
                          hintText: 'Password',
                          obscureText: ConfirmRegisterobsecurepassword.value,
focus: ConfirmRegisterpasswordfocus,
                          icon: InkWell(
                            onTap: () {
                              // Toggle the visibility of the password
                              ConfirmRegisterobsecurepassword.value = !ConfirmRegisterobsecurepassword.value;
                            },
                            child: Icon(
                              ConfirmRegisterobsecurepassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                            ),


                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != RegisterpasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        );
                      }

                      ),

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
                            // Form is valid, proceed with your sign-in logic
                            Signup(context);


                          }
                        }

                      ),

                      SizedBox(height: screenSize.height * 0.02),

                      // or continue with

                      SizedBox(height: screenSize.height * 0.02),



                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already a Member ',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          SizedBox(height: screenSize.width * 0.2),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.login);
                            },
                            child: const Text(
                              'Login Now',
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
                )
              ],

            ),
          ),
        ),
      ),
    );
  }

}
