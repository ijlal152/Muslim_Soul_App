import 'package:get/get.dart';

class MainHomeController extends GetxController{
  var selectedIndex = 0.obs;


  updateIndex(index){
    selectedIndex.value = index;
  }

}