import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';


class ReusableDescription extends StatelessWidget {
  const ReusableDescription({
    super.key, required this.header, required this.description
  });
  final String header;
  final String description;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text( header ,
          style: const TextStyle(
              fontSize: AppFontSize.h12,
              fontWeight: AppFontWeight.w500,
              color: AppColor.white
          ),
        ),
        const SizedBox(width: 2,),
         Text(description,
          style: const TextStyle(
              fontSize: AppFontSize.h12,
              fontWeight: AppFontWeight.w300,
              color: AppColor.white
          ),
        ),
      ],
    );
  }
}