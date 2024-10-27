import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stromleser/HomePage.dart';

import 'Theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    ));
  }
}



