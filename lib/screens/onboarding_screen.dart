import 'package:flutter/material.dart';
import 'package:movie_zone/screens/login_screen.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_content.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:movie_zone/widgets/custom_elevated_button.dart';
import 'package:movie_zone/widgets/reusable_indicator.dart';




class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnBoardingContent> screenContent=[
    OnBoardingContent(image: AppContent.onBoard1, description: "watch the best movies and the best series in the world", title: "Welcome To \nMovie Zone"),
    OnBoardingContent(image: AppContent.onBoard2, description: "Experience quality your tips movies at  ", title: "The best watch \nand quality"),
    OnBoardingContent(image: AppContent.onBoard3, description: "Always experience the world of movie entertainment ", title: "Explore Amazing \nMovies Now")
  ];
  late PageController controller;
  int currentIndex=0;
  @override
  void initState() {
    super.initState();
    controller=PageController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView.builder(
            controller: controller,
            itemCount: screenContent.length,
            onPageChanged: (val){
              debugPrint(val.toString());
              setState(() {
                currentIndex=val;
              });
            },
            itemBuilder: (context,index) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(screenContent[index].image),
                        fit: BoxFit.cover,
                      )
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20,bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(screenContent[index].title,
                          style: const TextStyle(
                            letterSpacing: 3,
                            color: AppColor.white,
                            fontWeight: AppFontWeight.w500,
                            fontSize: AppFontSize.h30,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.s10,),
                         Text(screenContent[index].description,
                          style: const TextStyle(
                              color: AppColor.white,
                              fontSize: AppFontSize.h12,
                              fontWeight: AppFontWeight.w300
                          ),
                        ),
                        const SizedBox(height: AppSpacing.s10,),
                        ReusableIndicator(screenContent: screenContent, currentIndex: currentIndex),
                        const SizedBox(height: AppSpacing.s10,),
                        CustomElevatedButton(text: currentIndex==screenContent.length-1?"Start":"Next",
                          onPress: () {
                            currentIndex==3?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()),):
                          controller.animateToPage(
                              currentIndex++,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut,);
                          },
                        ),
                      ],
                    ),
                  ),
              );
            },
          ),
        )
      ),
    );
  }
}


class OnBoardingContent{
  final String image;
  final String title;
  final String description;
  OnBoardingContent({required this.image, required this.description, required this.title});
}
