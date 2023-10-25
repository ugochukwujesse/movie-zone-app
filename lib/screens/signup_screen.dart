import 'package:flutter/material.dart';
import 'package:movie_zone/screens/home_screen.dart';
import 'package:movie_zone/screens/login_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
          child:
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.s20, left: AppSpacing.s20,right: AppSpacing.s20),
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
                const ReusableTextField(headText: "Enter your username", hintText: "Your username"),
                const SizedBox(height: AppSpacing.s20,),
                const ReusableTextField(headText: 'Enter your Email', hintText: 'Your Email',),
                const SizedBox(height: AppSpacing.s20,),
                const ReusableTextField(headText: "Enter your password", hintText: "Your password"),
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen(),),);
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
    );
  }
}