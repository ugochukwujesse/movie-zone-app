import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/screens/login_screen.dart';
import 'package:movie_zone/service/firebase_auth_service.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:movie_zone/widgets/reusable_row.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){Navigator.of(context).pop();},
            child: const Padding(
              padding: EdgeInsets.only(left: AppSpacing.s20, top: AppSpacing.s20),
              child: Icon(Icons.arrow_back_ios_rounded,color: AppColor.white,),
            ),
          ),
          const SizedBox(height: AppSpacing.s10,),
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.white,
                  child: Icon(Icons.camera_alt_outlined,color: AppColor.darkBlue,size: 30,) ,
                ),
                SizedBox(height: AppSpacing.s5,),
                Text("Jesse",
                style: TextStyle(
                  fontSize: AppFontSize.h16,
                  fontWeight: AppFontWeight.w400,
                  color: AppColor.white
                ),
                )
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.s30),
          ReusableRow(
            isNextIcon: true,
            icon: const Icon(Icons.person_rounded,color: AppColor.darkBlue,size: 20),
            description: 'Manage Profiles',
            isCircleAvater: true,
          ),
          const SizedBox(height: AppSpacing.s30,),
         const Divider(
            height: 3,
            color: AppColor.ash,
          ),
          const SizedBox(height: AppSpacing.s30,),
          ReusableRow(
              isNextIcon: true,
              icon: const Icon(Icons.settings, size: 30,color: AppColor.white,),
              description: "Settings",
            isCircleAvater: false,
          ),
          const SizedBox(height: AppSpacing.s20,),
          ReusableRow(
              isNextIcon: false,
              icon:  const Icon(Icons.person_rounded,color: AppColor.darkBlue,size: 20),
              description: "My Account",
              isCircleAvater: true
          ),
          const SizedBox(height: AppSpacing.s20,),
          ReusableRow(
              isNextIcon: false,
              icon: const Icon(Icons.question_mark,color: AppColor.darkBlue,size: 20,),
              description: "Help",
              isCircleAvater: true
          ),
          const SizedBox(height: AppSpacing.s20,),
          ReusableRow(
              isNextIcon: false,
              icon:const  Icon(Icons.verified_user,color: AppColor.white,size: 30,),
              description: "Privacy policy and cookies",
              isCircleAvater: false
          ),
          const SizedBox(height: AppSpacing.s30,),
          const Divider(
            height: 3,
            color: AppColor.ash,
          ),
          const SizedBox(height: AppSpacing.s30),
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen()));
            },
            child: ReusableRow(
                isNextIcon: false,
                icon: const Icon(Icons.logout, color: AppColor.white,size: 30,),
                description: "Sign out",
                isCircleAvater: false),
          )

        ],
      ),
      ),
    );
  }
}
