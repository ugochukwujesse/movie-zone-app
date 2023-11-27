import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';


class ReusableHeader extends StatelessWidget {
  const ReusableHeader({
    super.key, required this.text
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  const EdgeInsets.only(left: AppSpacing.s20,bottom: AppSpacing.s20),
      child:  Text( text,
        style: const TextStyle(
          fontWeight: AppFontWeight.w500,
          fontSize: AppFontSize.h18,
          color: AppColor.white,
        ),
      ),
    );
  }
}