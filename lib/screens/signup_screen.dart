import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/screens/home_screen.dart';
import 'package:movie_zone/screens/login_screen.dart';
import 'package:movie_zone/service/firebase_auth_service.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:movie_zone/widgets/custom_elevated_button.dart';
import 'package:movie_zone/widgets/custom_rich_text.dart';
import 'package:movie_zone/widgets/reusable_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
          child:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSpacing.s20, left: AppSpacing.s20,right: AppSpacing.s20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text("Welcome to",
                          style: TextStyle(
                              fontSize: AppFontSize.h16,
                              fontWeight: AppFontWeight.w300,
                              color: AppColor.white
                          ),
                        ),
                        SizedBox(
                          width: AppSpacing.s5,
                        ),
                        Text("Movie Zone",
                          style: TextStyle(
                              fontWeight: AppFontWeight.w500,
                              fontSize: AppFontSize.h16,
                              color: AppColor.red
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s20,),
                    const Text("Sign up",
                      style: TextStyle(
                        fontSize: AppFontSize.h30,
                        fontWeight: AppFontWeight.w500,
                        color: AppColor.white,
                      ),
                    ),
                    const  SizedBox(height: AppSpacing.s30,),
                     ReusableTextField(headText: "Enter your username",
                       hintText: "Your username",
                       newController: _usernameController,
                       validate: (text) {
                           if (text == null || text.isEmpty) {
                             return "please enter username";
                           } return null;
                       },

                     ),
                    const SizedBox(height: AppSpacing.s20,),
                     ReusableTextField(headText: 'Enter your Email',
                       hintText: 'Your Email', newController: _emailController,
                       validate: (text) {
                           if (text == null || text.isEmpty) {
                             return "please enter email";
                           }else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text)){
                             return null;
                           }
                           return "invalid Email";
                       },

                     ),
                    const SizedBox(height: AppSpacing.s20,),
                     ReusableTextField(headText: "Enter your password",
                       hintText: "Your password",
                       newController: _passwordController,
                       validate: (text) {
                           if (text == null || text.isEmpty) {
                             return "please enter password";
                           }return null;
                       },
                     ),
                    const SizedBox(height: AppSpacing.s5,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password?',
                          style: TextStyle(
                            fontWeight: AppFontWeight.w300,
                            fontSize: AppFontSize.h12,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s30,),
                    CustomElevatedButton(text: "Sign up",
                      onPress:(){
                        if (_formKey.currentState != null &&_formKey.currentState!.validate()){
                          _signUp();
                        }

                      },
                    ),
                    const SizedBox(
                      height: AppSpacing.s30,
                    ),
                    CustomRichText(
                      label1: 'Have an account?',
                      label2: 'Sign in',
                      navigation: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
  void _signUp() async {
   String username = _usernameController.text;
   String email= _emailController.text;
   String password= _passwordController.text;

   User? user = await _auth.signUpWithEmailAndPassword(email, password);


   if(user!= null){
     print("User is successfully created");
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomeScreen(),),);
   } else{
     print("some error occurred ");
   }


  }

}
