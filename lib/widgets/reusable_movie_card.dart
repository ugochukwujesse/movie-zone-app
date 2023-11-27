import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_content.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:shimmer/shimmer.dart';



class ReusableMovieCard extends StatelessWidget {
  const ReusableMovieCard({
    super.key, required this.title, required this.genre, required this.image
  });
  final String title;
  final String genre;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppSpacing.s20,),
      decoration: const BoxDecoration(
        color: AppColor.darkBlue,
        // borderRadius: BorderRadius.circular(AppSpacing.s20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              color: AppColor.ash,
              borderRadius: BorderRadius.circular(AppSpacing.s10),
              image:   DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),

            ),
          ),
            Container(
              padding:  const EdgeInsets.only(bottom:AppSpacing.s5,top: AppSpacing.s5, right: AppSpacing.s10),
              width: 110,
              child: Text( title,
               overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: AppFontSize.h12,
                    fontWeight: AppFontWeight.w500,
                    color: AppColor.white
                ),
              ),
            ),
           Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s5),
            child:  Text( genre,
              style: const TextStyle(
                  fontWeight: AppFontWeight.w400,
                  fontSize: AppFontSize.h10,
                  color: AppColor.white
              ),
            ),
          )
        ],
      ),
    );
  }
}