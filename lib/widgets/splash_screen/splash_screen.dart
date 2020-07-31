import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/widgets/home/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: HomeScreen(),
      title: Text('Welcome In SplashScreen',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }
}