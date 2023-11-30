import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';



class ReusableBigMovieCard extends StatelessWidget {
  const ReusableBigMovieCard({
    super.key,required this.title, required this.ratings, required this.image, required this.description,
  });
  final String title;
  final int  ratings;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.s20, top: AppSpacing.s20),
      child: Container(
        padding: const EdgeInsets.only(left: AppSpacing.s20, right: AppSpacing.s20,bottom: AppSpacing.s5),
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.darken)
          ),
          borderRadius: BorderRadius.circular(AppSpacing.s20),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: const TextStyle(
                fontWeight: AppFontWeight.w500,
                fontSize: AppFontSize.h18,
                color: AppColor.white,
              ),
            ),
            const SizedBox(height: AppSpacing.s5,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding:  const EdgeInsets.only(right: 30),
                  child:  Text( description,
                    style: const TextStyle(
                      fontWeight: AppFontWeight.w400,
                      fontSize: AppFontSize.h10,
                      color: AppColor.white,
                    ),
                  ),
                ),
                const SizedBox(width: 30,  ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      const Icon(Icons.star,
                        color: AppColor.red,
                        size: AppSpacing.s20,
                      ),
                      const SizedBox(width: AppSpacing.s5,),
                      Text(ratings.toString(),
                        style: const TextStyle(
                          fontWeight: AppFontWeight.w500,
                          fontSize: AppFontSize.h12,
                          color: AppColor.red,
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}