import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';



class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    super.key, required this.headText, required this.hintText, required this.newController, required this.validate
  });
  final String headText;
  final String hintText;
  final TextEditingController newController;
  final FormFieldValidator validate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(headText,
          style: const TextStyle(
              fontSize: AppFontSize.h12,
              fontWeight: AppFontWeight.w400,
              color: AppColor.white
          ),
        ),
        const SizedBox(height: AppSpacing.s5,),
        TextFormField(
          controller: newController ,
          validator: validate,
          decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.s10),
                  borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none
                  )
              ),
              fillColor: AppColor.ash,
              filled: true,
              hintText: hintText,
              hintStyle:  TextStyle(
                fontWeight: AppFontWeight.w300,
                fontSize: AppFontSize.h12,
                color: AppColor.offWhite,
              )
          ),

        ),
      ],
    );
  }
}
