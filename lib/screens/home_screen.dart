import 'package:flutter/material.dart';
import 'package:movie_zone/model/get_all_top_rated_movies_model.dart';
import 'package:movie_zone/screens/about_screen.dart';
import 'package:movie_zone/screens/profile_screen.dart';
import 'package:movie_zone/service/movie_service.dart';
import 'package:movie_zone/utility/app_colour.dart';
import 'package:movie_zone/utility/app_font_size.dart';
import 'package:movie_zone/utility/app_font_weight.dart';
import 'package:movie_zone/utility/app_spacing.dart';
import 'package:movie_zone/widgets/reusable_big_movie_card.dart';
import 'package:movie_zone/widgets/reusable_header.dart';
import 'package:movie_zone/widgets/reusable_movie_card.dart';
import 'package:shimmer/shimmer.dart';


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
        child: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.s20, right: AppSpacing.s20,top: AppSpacing.s20),
                child: Row(
                  children: [
                    Expanded(
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
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: AppColor.white,)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.person_outline_rounded, color: AppColor.white,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder  (
                future: MovieService.topRatedMovies(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                   return SizedBox(
                     height: 170,
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                       itemCount: 5,
                         itemBuilder: (context, index){
                           return Shimmer.fromColors(
                             baseColor: AppColor.ash,
                             highlightColor: AppColor.offWhite,
                             child:SizedBox(
                               width: 300,
                               child: Padding(
                                 padding: const EdgeInsets.only(left: AppSpacing.s20, top: AppSpacing.s20),
                                 child: Container(
                                   padding: const EdgeInsets.only(left: AppSpacing.s20, right: AppSpacing.s20,bottom: AppSpacing.s5),
                                   decoration: BoxDecoration(
                                    color: Colors.white,
                                     borderRadius: BorderRadius.circular(AppSpacing.s20),
                                   ),
                                   child:  const Column(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("",
                                         style:  TextStyle(
                                           fontWeight: AppFontWeight.w500,
                                           fontSize: AppFontSize.h18,
                                           color: AppColor.white,
                                         ),
                                       ),
                                        SizedBox(height: AppSpacing.s5,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Padding(
                                             padding:   EdgeInsets.only(right: 30),
                                             child:  Text( "",
                                               style:  TextStyle(
                                                 fontWeight: AppFontWeight.w400,
                                                 fontSize: AppFontSize.h10,
                                                 color: AppColor.white,
                                               ),
                                             ),
                                           ),
                                            SizedBox(width: 30,  ),
                                           Padding(
                                             padding:  EdgeInsets.only(left: 30),
                                             child: Row(
                                               children: [
                                                  Icon(Icons.star,
                                                   color: AppColor.red,
                                                   size: AppSpacing.s20,
                                                 ),
                                                  SizedBox(width: AppSpacing.s5,),
                                                 Text("",
                                                   style:  TextStyle(
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
                               ),
                             ),
                           );

                         }
                     ),
                   );
                  }
            else if(snapshot.hasData){
                    print(snapshot.data);
                    return
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.d.length ,
                            itemBuilder: (context,index){
                              final data = snapshot.data;
                              return   SizedBox(
                                width: 300,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AboutScreen()));
                                  },
                                  child: ReusableBigMovieCard(
                                    title: data!= null?  snapshot.data!.d[index].l: 'No title',
                                    ratings: data!= null? snapshot.data!.d[index].y ?? 0 : 0 ,
                                    image: data!=null? snapshot.data!.d[index].i != null?  snapshot.data!.d[index].i!.imageUrl : "https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg" : 'https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg',
                                    description: data!=null? snapshot.data!.d[index].q ?? "": 'No description'
                                    ,),
                                ),
                              );
                            }
                        ),
                      );
                  }
                  else {
                    print(snapshot.stackTrace);
                    print(snapshot.error);
                    return Text("Data: ${snapshot.error}");
                  }
                },
              ),
              const SizedBox(height: AppSpacing.s20,),
              const ReusableHeader(text: 'New Releases',),
              FutureBuilder(
                future: MovieService.newMovies(),
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
                                  ReusableMovieCard(title: snapshot.data!.d[index].l,
                                      genre: snapshot.data!.d[index].q,
                                    image: snapshot.data!=null? snapshot.data!.d[index].i != null?  snapshot.data!.d[index].i!.imageUrl : "https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg" : 'https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg',
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
              ),
              const SizedBox(height: AppSpacing.s20,),
              const ReusableHeader(text: "Popular"),
             FutureBuilder(
               future: MovieService.gameMovies(),
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
                                  ReusableMovieCard(title: snapshot.data!.d[index].l,
                                    genre:snapshot.data!.d[index].q??="movie",
                                    image:snapshot.data!=null? snapshot.data!.d[index].i != null?  snapshot.data!.d[index].i!.imageUrl : "https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg" : 'https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg',
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
             ),
              const SizedBox(height: AppSpacing.s20,),
              const ReusableHeader(text: "Animation"),
              FutureBuilder(
                future: MovieService.animations(),
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
                              ReusableMovieCard(
                                  title: snapshot.data!.d[index].l,
                                  genre: snapshot.data!.d[index].q??="Animation",
                                  image: snapshot.data!=null? snapshot.data!.d[index].i != null?  snapshot.data!.d[index].i!.imageUrl : "https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg" : 'https://www.malaco.com/wp-content/uploads/2016/06/no-photo-available-black-profile.jpg',
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
      ),
    );
  }
}




