import 'package:flutter/material.dart';
import 'package:movie_zone/screens/onboarding_screen.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_spacing.dart';



class ReusableIndicator extends StatelessWidget {
  const ReusableIndicator({
    super.key,
    required this.screenContent,
    required this.currentIndex,
  });

  final List<OnBoardingContent> screenContent;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children:
        List.generate(screenContent.length,
              (index) =>
              Container(
                width: currentIndex==index?AppSpacing.s30:AppSpacing.s5,
                height: AppSpacing.s5,
                margin: const EdgeInsets.only(right: AppSpacing.s5),
                decoration: BoxDecoration(
                    color: currentIndex==index? AppColor.red:AppColor.white,
                    borderRadius:   BorderRadius.circular(AppSpacing.s5)
                ),
              ),
        ),
      ),
    );
  }
}