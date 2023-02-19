import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:muslimsoul/constants/assets.dart';
import 'package:muslimsoul/constants/strings.dart';
import 'package:muslimsoul/models/aya_of_the_day.dart';
import 'package:muslimsoul/services/api_services.dart';

class HomeScreen extends StatelessWidget {

  ApiServices apiServices = ApiServices();
  AyaOfTheDay? data;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var date = HijriCalendar.setLocal('ar');
    var hijri = HijriCalendar.now();
    var day = DateTime.now();
    var formatt = DateFormat('EE, d MMM yyyy');
    var formatted = formatt.format(day);

    //piServices.getAyaOfTheDay().then((value) => data = value);

    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.22, // 22% of screen
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage(backgroundImg)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              style: const TextStyle(fontSize: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(hijri.hDay.toString(),style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),),
                                )
                            ),
                            WidgetSpan(
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(hijri.longMonthName.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),),
                                )
                            ),
                            WidgetSpan(
                                style: const TextStyle(fontSize: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(hijri.hYear.toString(),style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                  ),),
                                )
                            ),
                          ]
                        )
                    ),

                    Text(formatted, style: const TextStyle(color: Colors.white, fontSize: 30),)
                  ],
                ),
              ),

              //SizedBox(height: 50,),

              SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder<AyaOfTheDay>(
                      future: apiServices.getAyaOfTheDay(),
                        builder: (BuildContext context, snapshot){
                          switch(snapshot.connectionState){
                            case ConnectionState.none:
                              return const Icon(Icons.sync_problem);
                            case ConnectionState.waiting:
                              return const Center(child: Icon(Icons.watch_later));
                            case ConnectionState.active:
                              return const Center(child: CircularProgressIndicator());
                            case ConnectionState.done:
                              return Container(
                                padding: const EdgeInsetsDirectional.all(20),
                                margin: const EdgeInsetsDirectional.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ]
                                ),
                                child: Column(
                                  children:  [
                                    const Text(quranAyaOfTheDay, style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),),

                                    const Divider(color: Colors.black, thickness: 0.5,),

                                    Text(snapshot.data!.arText!, style: const TextStyle(
                                        color: Colors.black54
                                    ),),

                                    Text(snapshot.data!.enTranslation!, style: const TextStyle(
                                        color: Colors.black54
                                    ),),

                                    RichText(
                                        text: TextSpan(
                                            children: <InlineSpan>[
                                              WidgetSpan(
                                                  child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(snapshot.data!.surahNumber!.toString()))
                                              ),
                                              WidgetSpan(
                                                  child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(snapshot.data!.surahEnName!.toString()))
                                              ),
                                            ]
                                        )
                                    ),

                                  ],
                                ),
                              );
                          }
                        }
                    )

                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
