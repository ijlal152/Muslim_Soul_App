import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:muslimsoul/models/aya_of_the_day.dart';

class ApiServices{

  List<AyaOfTheDay> jsonData = [];

  Future<List<AyaOfTheDay>> getQuranAyaData() async{
    final response = await http.get(Uri.parse('http://api.alquran.cloud/v1/ayah/${random(1, 6236)}262/editions/quran-uthmani,en.asad,en.pickthall'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map<String, dynamic> i in data){
        jsonData.add(AyaOfTheDay.fromJson(i));
      }
      return jsonData;
    }else{
      return jsonData;
    }
  }

  Future<AyaOfTheDay> getAyaOfTheDay() async{

    // for random Aya we need to generate random number
    String url = "https://api.alquran.cloud/v1/ayah/${random(1, 6236)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      //print(response.body.toString());
      return AyaOfTheDay.fromJson(jsonDecode(response.body.toString()));
      //return AyaOfTheDay.fromJson(jsonDecode(response.body.toString()));

    }else{
      //print(response.body.toString());
      print('Failed to load');
      throw Exception('Failed to Load');
    }
  }

  random(min, max){
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

}