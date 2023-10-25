import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';



class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key, required this.label1, required this.label2, required this.navigation
  });
  final String label1;
  final String label2;
  final Function() navigation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(text:
       TextSpan(
          text: label1,
          style: const TextStyle(
            fontSize: AppFontSize.h12,
            fontWeight: AppFontWeight.w400,
            color: AppColor.white,
          ),
          children: [
            TextSpan(
                text: label2,
                style:  const TextStyle(
                    fontWeight:AppFontWeight.w400,
                    fontSize: AppFontSize.h12,
                    color: AppColor.red
                ),
              recognizer: TapGestureRecognizer()..onTap= navigation,
            )
          ]
      ),
      ),
    );
  }
}
