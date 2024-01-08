import 'package:flutter/material.dart';
import 'package:movie_zone/service/movie_service.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:movie_zone/widgets/reusable_about_container.dart';
import 'package:movie_zone/widgets/reusable_description.dart';
import 'package:movie_zone/widgets/reusable_header.dart';
import 'package:movie_zone/widgets/reusable_movie_card.dart';
import 'package:shimmer/shimmer.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key, required this.selectedMovies}) : super(key: key); 
  final MyMovieDetailModel selectedMovies;



  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Container(
                padding: const EdgeInsets.only(top: AppSpacing.s30,left: AppSpacing.s20),
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image:  NetworkImage(widget.selectedMovies.image),
                    fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7),
                          BlendMode.darken)
                  )
                ),
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         GestureDetector(
                           onTap:(){
                             Navigator.of(context).pop();
                           },
                             child: const Icon(Icons.arrow_back_ios_rounded,color: AppColor.white,)),
                      ],
                    ),
                    const Expanded(
                      child: Center(
                        child: CircleAvatar(
                          radius: AppSpacing.s30,
                            backgroundColor: AppColor.white,
                            child: Icon(Icons.play_arrow, color: AppColor.darkBlue,size: 40,)),
                      ),
                    )
                  ],
                ),

              ),
            ),
          const  SizedBox(height: AppSpacing.s20,),
           const  Padding(
             padding:   EdgeInsets.only(left: AppSpacing.s20, right: AppSpacing.s20),
             child:   Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   ReusableAboutContainer(
                     icon:  Icon(Icons.add, size: 18,color: AppColor.white,),
                     text: "Add as favorite",
                   ),
                  ReusableAboutContainer(
                      icon: Icon(Icons.share,size: 18, color: AppColor.white,),
                      text: "Share favorite"),
                ],
              ),
           ),
            const SizedBox(height: AppSpacing.s20,),
             Padding(
              padding: const  EdgeInsets.only(left: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(widget.selectedMovies.title,
                   style: const TextStyle(
                     fontWeight: AppFontWeight.w500,
                     fontSize: AppFontSize.h20,
                     color: AppColor.white
                   ),
                   ),
                  const SizedBox(height: AppSpacing.s10,),
                   ReusableDescription(header: 'Genre:', description: widget.selectedMovies.genre,),
                 const  SizedBox(height: AppSpacing.s10,),
                   ReusableDescription(header: "Actor:", description: widget.selectedMovies.actor),
                  const SizedBox(height: AppSpacing.s10,),
                   ReusableDescription(header: "Year:", description: widget.selectedMovies.year.toString()),
                  const SizedBox(height: AppSpacing.s30,),
                ],
              ),
            ),
            const ReusableHeader(text: "You may also like"),
            FutureBuilder(
                future: MovieService.party(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return  SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: ( context,  index) {
                          return
                            Container(
                              padding: const EdgeInsets.only(left: AppSpacing.s20,),
                              decoration: const BoxDecoration(
                                color: AppColor.darkBlue,
                                // borderRadius: BorderRadius.circular(AppSpacing.s20)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor:   AppColor.ash,
                                    highlightColor: AppColor.offWhite,
                                    child: Container(
                                      height: 150,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: AppColor.ash,
                                        borderRadius: BorderRadius.circular(AppSpacing.s10),
                                        image:   const DecorationImage(
                                          image: NetworkImage(""),
                                          fit: BoxFit.fill,
                                        ),

                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Shimmer.fromColors(
                                    baseColor: AppColor.ash,
                                    highlightColor: AppColor.offWhite,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.white,
                                      ),
                                      padding:  const EdgeInsets.only(bottom:AppSpacing.s5,top: AppSpacing.s5, right: AppSpacing.s10),
                                      height: 10,
                                      width: 110,
                                      child: const Text( "",
                                        overflow: TextOverflow.ellipsis,
                                        style:  TextStyle(
                                            fontSize: AppFontSize.h12,
                                            fontWeight: AppFontWeight.w500,
                                            color: AppColor.white
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Shimmer.fromColors(
                                    baseColor: AppColor.ash,
                                    highlightColor: AppColor.offWhite,
                                    child: Container(
                                      height: 8,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColor.white
                                      ),
                                      child: const Padding(
                                        padding:  EdgeInsets.only(bottom: AppSpacing.s5),
                                        child:  Text( "",
                                          style:  TextStyle(
                                              fontWeight: AppFontWeight.w400,
                                              fontSize: AppFontSize.h10,
                                              color: AppColor.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                        },
                      ),
                    );
                  }
                  else if(snapshot.hasData){
                    print(snapshot.data);
                    return
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.d.length,
                            itemBuilder: (context, index){
                              return
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: ReusableMovieCard(
                                    title: snapshot.data!.d[index].l,
                                    genre: snapshot.data!.d[index].q??="Movie",
                                    image: snapshot.data!=null? snapshot.data!.d[index].i != null?  snapshot.data!.d[index].i!.imageUrl : "https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg" : 'https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg',
                                  ),
                                );
                            }
                        ),
                      );
                  }
                  else{
                    print(snapshot.stackTrace);
                    print(snapshot.error);
                    return Text("Data: ${snapshot.error}");
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}

class MyMovieDetailModel{
  MyMovieDetailModel({
  required this.image, required this.title, required this.genre, required this.year, required this.actor});
  String genre;
  String title;
  int year;
  String image;
  String actor;
}