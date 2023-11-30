import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/firebase_options.dart';
import 'package:movie_zone/screens/login_screen.dart';
import 'package:movie_zone/screens/splash_screen.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MovieZone());
}
class MovieZone extends StatefulWidget {
  const MovieZone({Key? key}) : super(key: key);

  @override
  State<MovieZone> createState() => _MovieZoneState();
}

class _MovieZoneState extends State<MovieZone> {
  final auth=FirebaseAuth.instance;
  bool isLogin = false;

  checkIfLogin(){
    auth.authStateChanges().listen((User? user) {
      if(user!= null && mounted){
        setState(() {
          isLogin=true;
        });
      }
    });
  }
  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin?const  LoginScreen(): const SplashScreen(),
    );
  }
}
