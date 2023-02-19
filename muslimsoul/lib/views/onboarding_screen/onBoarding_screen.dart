import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:muslimsoul/constants/assets.dart';
import 'package:muslimsoul/constants/constants.dart';
import 'package:muslimsoul/constants/strings.dart';
import 'package:muslimsoul/views/home/home_main_screen.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: readQuranText,
                bodyWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(quranText, textAlign: TextAlign.center ,style: TextStyle(
                          fontSize: 16
                      ),),
                    ),
                    //Text('to edit a post'),
                  ],
                ),
                image: Center(
                  child: Image.asset(quranPng, fit: BoxFit.fitWidth,),
                ),
                decoration: const PageDecoration(
                  pageColor: Colors.white,
                ),
              ),

              PageViewModel(
                title: prayerAlert,
                bodyWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(prayerText, textAlign: TextAlign.center ,style: TextStyle(
                          fontSize: 16
                      ),),
                    ),
                    //Text('to edit a post'),
                  ],
                ),
                image: Center(
                  child: Image.asset(namazPng, fit: BoxFit.fitWidth,),
                ),
                decoration: const PageDecoration(
                  pageColor: Colors.white,
                ),
              ),

              PageViewModel(
                title: buildBetterHabits,
                bodyWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(habbitText, textAlign: TextAlign.center ,style: TextStyle(
                          fontSize: 16
                      ),),
                    ),
                    //Text('to edit a post'),
                  ],
                ),
                image: Center(
                  child: Image.asset(zakatPng, fit: BoxFit.fitWidth,),
                ),
                decoration: const PageDecoration(
                  pageColor: Colors.white,
                ),
              ),
            ],
            showSkipButton: true,
            skip: const Icon(Icons.skip_next),
            next: const Icon(Icons.arrow_forward, color: Colors.black,),
            done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
            onDone: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
            onSkip: () {
              // On Skip button pressed
            },
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Constants.kPrimary,
              color: Colors.grey,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
            ),
          )
      ),
    );
  }
}
