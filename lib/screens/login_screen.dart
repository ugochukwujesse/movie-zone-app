import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/screens/home_screen.dart';
import 'package:movie_zone/screens/signup_screen.dart';
import 'package:movie_zone/service/firebase_auth_service.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:movie_zone/widgets/custom_elevated_button.dart';
import 'package:movie_zone/widgets/custom_rich_text.dart';
import 'package:movie_zone/widgets/reusable_text_field.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();


  // final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    // _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.only(top: AppSpacing.s20, left: AppSpacing.s20, right: AppSpacing.s20),
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
                   const Text("Sign in",
                  style: TextStyle(
                    fontSize: AppFontSize.h30,
                    fontWeight: AppFontWeight.w500,
                    color: AppColor.white,
                  ),
                  ),
                  const  SizedBox(height: AppSpacing.s30,),
                   ReusableTextField(headText: 'Enter your Email', hintText: 'Your Email', newController: _emailController,),
                  const SizedBox(height: AppSpacing.s20,),
                  ReusableTextField(headText: "Enter your password", hintText: "Your password", newController: _passwordController,),
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
                  CustomElevatedButton(text: "Sign in",
                    onPress:(){
                    _signIn();
                    },
                  ),
                  const SizedBox(
                    height: AppSpacing.s30,
                  ),
                   CustomRichText(
                    label1: 'Don\'n have an account?',
                    label2: 'Sign up',
                    navigation: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                    },
                  )
                ],
      ),
            ),
          ),
      ),
    );
  }
  void _signIn() async {
    // String username = _usernameController.text;
    String email= _emailController.text;
    String password= _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);


    if(user!= null){
      print("User is successfully signedIn");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomeScreen(),),);
    } else{
      print("some error occurred ");
    }
  }
}
