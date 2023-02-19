import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimsoul/constants/constants.dart';
import 'package:muslimsoul/controllers/MainHomeController.dart';
import 'package:muslimsoul/views/home/convexBottomBarScreen/HomeScreen.dart';
import 'package:muslimsoul/views/home/convexBottomBarScreen/prayer_screen.dart';
import 'package:muslimsoul/views/home/convexBottomBarScreen/quran_screen.dart';

import 'convexBottomBarScreen/audio_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int selectedIndex = 0;

  List<Widget> _widgetList = [
    HomeScreen(),
    QuranScreen(),
    AudioScreen(),
    PrayerScreen(),
  ];

  // void updateIndex(index){
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var mainHomeController = Get.put(MainHomeController());
    return Obx(
        () => Scaffold(

        body: _widgetList[mainHomeController.selectedIndex.value],

          bottomNavigationBar: ConvexAppBar(
            items: const [
              TabItem(icon: Icons.home ,title: 'Home'),
              TabItem(icon: Icons.book_outlined, title: 'Quran'),
              TabItem(icon: Icons.audiotrack, title: 'Audio'),
              TabItem(icon: Icons.message, title: 'Prayer'),
              //TabItem(icon: Icons.people, title: 'Profile'),
            ],
            onTap: (int i) => mainHomeController.updateIndex(i),
            backgroundColor: Constants.kPrimary,
            //activeColor: Constants.kPrimary,
          )
      ),
    );
  }
}
