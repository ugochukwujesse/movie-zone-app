import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';

import '../utility/app_spacing.dart';


class ReusableRow extends StatelessWidget {
   ReusableRow({ required this.isNextIcon, required this.icon, required this.description, required this.isCircleAvater,
    super.key,
  });
 final bool isNextIcon;
 final String description;
 final Icon icon;
 final bool isCircleAvater;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: AppSpacing.s20,right: AppSpacing.s20),
      child: Row(
        children: [
           isCircleAvater? CircleAvatar(
            radius: 15,
            backgroundColor: AppColor.white,
            child: icon ,
          ): icon,
          const SizedBox(width: AppSpacing.s20,),
           Expanded(
            child: Text( description,
              style: const TextStyle(
                  fontWeight: AppFontWeight.w400,
                  fontSize: AppFontSize.h18,
                  color: AppColor.white
              ),
            ),
          ),
        isNextIcon? const Icon(Icons.navigate_next,color: AppColor.white,size: 30,): const SizedBox(),
        ],
      ),
    );
  }
}
