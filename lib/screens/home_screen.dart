import 'package:flutter/material.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppSpacing.s20, right: AppSpacing.s20,top: AppSpacing.s20),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: AppSpacing.s10,bottom:AppSpacing.s10,right: AppSpacing.s20,left:AppSpacing.s20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.s10),
                  ),
                  fillColor: AppColor.white,
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: AppFontSize.h16,
                    fontWeight: AppFontWeight.w400,
                    color: AppColor.darkBlue
                  ),
                  suffixIcon: const Icon( Icons.mic,
                    color: AppColor.ash,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.s20)
              ),
            )
          ],
        ),
      ),
    );
  }
}
