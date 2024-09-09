import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeData lighttheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Color(0xffF2F8FC),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)));
  ThemeData Darktheme = ThemeData.dark();

  RxBool isthemedark = true.obs;
  void changeTheme() {
    isthemedark.value = !isthemedark.value;
    print('theme changed');
    update();
  }
}
