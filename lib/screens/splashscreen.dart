import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/screens/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen() : super();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: backcolor,
      nextScreen:
          //LoginScreen()
          //CatProdScreen()
          HomeScreen()
      //CartScreen()
      //DisScreen()
      ,
      splash: Image.asset("assets/images/icon.png"),
      splashTransition: SplashTransition.slideTransition,
      //pageTransitionType: PageTransitionType.scale,
    );
  }
}
