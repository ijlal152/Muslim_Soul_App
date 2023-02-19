import 'dart:async';
import 'package:flutter/material.dart';
import 'package:muslimsoul/constants/assets.dart';
import 'package:muslimsoul/constants/strings.dart';
import 'package:muslimsoul/views/onboarding_screen/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => onBoardingScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text(muslimSoul, style: TextStyle(
                color: Colors.black, fontSize: 30
            ),),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(isLamicLogo)
          )
        ],
      ),
    );
  }
}