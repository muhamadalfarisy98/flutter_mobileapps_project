import 'package:flutter/material.dart';
// import 'LoginScreen.dart';
import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'StartingScreen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // @override
  // void initState(){
  //   super.initState();
  //   Timer(Duration(seconds: 3),(){
  //     Navigator.pushNamed(context, '/login');
  //   }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[300],
      body: 
          AnimatedSplashScreen(
              splash: Image.asset(
              'assets/img/gercep.png',
              height: 300,
              width: 300,
            ),
            nextScreen: StartingScreen(),
            splashTransition: SplashTransition.rotationTransition,
            duration: 2000,
            backgroundColor: Colors.cyan,
            ),

            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // )
          // ],
    );
  }
}