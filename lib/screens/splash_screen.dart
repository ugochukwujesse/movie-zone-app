import 'package:flutter/material.dart';
import 'package:movie_zone/screens/onboarding_screen.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_content.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>const OnboardingScreen()),);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppContent.splash,scale: 2.0,))
        ],
      ),
    );
  }
}
