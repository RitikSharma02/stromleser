import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color darkBG = Color(0xFF17181C);
const Color darkBG2 = Color(0xFF1E1F25);
const Color darkBG3 = Color(0xFF212528);
const Color darkBG4 = Color(0xFF2E3137);
final Color lightBG = Colors.grey.shade300;
final Color lightBG2 = Colors.grey.shade200;
final Color lightBG3 = Colors.grey.shade100;
final Color lightBG4 = Colors.grey.shade50;
// const Color lightBG = Color(0xFFFFb746);
const Color reddd = Color(0xFFff4667);
const Color darkgrey = Color(0xFF121212);
const Color darkheader = Color(0xFF424242);
const Color white = Colors.white;

class ThemeController extends GetxController {
  RxBool isDarkMode = true.obs;  // Start with dark mode

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkheader,
      titleTextStyle: TextStyle(color: white),
    ),
  );

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBG,
    primaryColor: reddd,
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      titleTextStyle: TextStyle(color: Colors.black),
    ),
  );
}

