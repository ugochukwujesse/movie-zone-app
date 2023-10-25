import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';




class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.text, required this.onPress
  });
  final String text;
  final Function() onPress;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.only(top: 10,bottom: 10)),
          backgroundColor: MaterialStateProperty.all(AppColor.red),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.s10),
            ),
          ),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text( text,
                style: const TextStyle(
                  fontWeight: AppFontWeight.w500,
                  fontSize: AppFontSize.h20,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        )
    );
  }
}