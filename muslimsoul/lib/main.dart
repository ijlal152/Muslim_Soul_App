import 'package:flutter/material.dart';
import 'package:muslimsoul/constants/constants.dart';

import 'views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.kSwatchColor,
        primaryColor: Constants.kPrimary,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white
      ),
      home: SplashScreen(),
    );
  }
}
