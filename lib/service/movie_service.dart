
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movie_zone/model/get_all_animation.dart';
import 'package:movie_zone/model/get_all_game_moives.dart';
import 'package:movie_zone/model/get_all_new_movies.dart';
import 'package:movie_zone/model/get_all_top_rated_movies_model.dart';
import 'package:http/http.dart'as http;

class MovieService{
  static Future<GetAllTopRatedMovies> topRatedMovies() async{
    final headers={
      'X-RapidAPI-Key': '386aed19famshee44c18be8b8ed7p17d1f1jsn805f805f1f9b',
      'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
    };
    final response= await http.
    get (Uri.parse( 'https://imdb8.p.rapidapi.com/auto-complete?q=top movies 2023'),headers:headers);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    if(response.statusCode==200){
      final decodeData=jsonDecode(response.body);
      final y=GetAllTopRatedMovies.fromJson(Map.from(decodeData));
      return y;
    }
    else{
      debugPrint("error = ${response.body}");
      debugPrint(response.statusCode.toString());
      throw Exception("Failed to load");
    }
  }
  
  static Future<GetAllNewMovies> newMovies() async {
    final headers={
      'X-RapidAPI-Key': '386aed19famshee44c18be8b8ed7p17d1f1jsn805f805f1f9b',
      'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
    };
    final response = await http.
    get(Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=2023'),headers: headers);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    if(response.statusCode==200){
      final decodeData=jsonDecode(response.body);
      final x= GetAllNewMovies.fromJson(Map.from(decodeData));
      return x;
    }
    else{
      throw Exception('Failed to load');
    }
  }
  static Future<GetAllGameMovies> gameMovies() async{
    final headers={
      'X-RapidAPI-Key': '386aed19famshee44c18be8b8ed7p17d1f1jsn805f805f1f9b',
      'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
    };
    final response = await http.
    get(Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=game'),headers: headers);
    debugPrint("this is my response: ${response.body}");
    debugPrint("this is my status code: ${response.statusCode.toString()}");

    if(response.statusCode==200){
      final decodeData=jsonDecode(response.body);
      final x= GetAllGameMovies.fromJson(Map.from(decodeData));
      return x;
    }
    else{
      debugPrint("error = ${response.body}");
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load');
    }

  }
  static Future<GetAllAnimation> animations() async{
    final headers={
      'X-RapidAPI-Key': '386aed19famshee44c18be8b8ed7p17d1f1jsn805f805f1f9b',
      'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
    };
    final response = await http.
    get(Uri.parse('https://imdb8.p.rapidapi.com/auto-complete?q=animations'),headers: headers);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    if(response.statusCode==200){
      final decodeData=jsonDecode(response.body);
      final x= GetAllAnimation.fromJson(Map.from(decodeData));
      return x;
    }
    else{
      throw Exception('Failed to load');
    }
  }
}