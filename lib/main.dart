import 'package:flutter/material.dart';
import 'package:movie_zone/screens/splash_screen.dart';

void main() {
  runApp(const MovieZone());
}
class MovieZone extends StatelessWidget {
  const MovieZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
