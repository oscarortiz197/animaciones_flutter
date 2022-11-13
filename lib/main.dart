import 'package:a6/principal.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'animaciones',
      home: Scaffold(
 
        body: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash:const incio(),
          splashIconSize: 300,
          centered: true,
          splashTransition:SplashTransition.fadeTransition,
          animationDuration: Duration(seconds: 3),
          curve: Curves.easeInCirc,
          duration: 5000,
          nextScreen: principal(),
        ),
      ),
    );
  }
}

class incio extends StatefulWidget {
  const incio({super.key});

  @override
  State<incio> createState() => _incioState();
}

class _incioState extends State<incio> {
  @override
  Widget build(BuildContext context) {
    return Column(  
      children:[ 
        Image.asset("assets/img/splash.gif"),
      
      ]
    );
  }
}
