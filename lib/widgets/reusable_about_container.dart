import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';



class ReusableAboutContainer extends StatelessWidget {
  const ReusableAboutContainer({
    super.key, required this.icon, required this.text
  });
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5 , right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: AppColor.white)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 5,),
          Text(text,
            style:const  TextStyle(
                fontSize: AppFontSize.h12,
                fontWeight: AppFontWeight.w400,
                color: AppColor.white
            ),
          )
        ],
      ),
    );
  }
}

