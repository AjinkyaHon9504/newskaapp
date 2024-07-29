import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newskaapp/Controller/BottomNavigationController.dart';
import 'package:newskaapp/DemoPage.dart';
import 'package:newskaapp/Pages/HomePage/HomePage.dart';
import 'package:newskaapp/Pages/ArticlePage/ArticlePage.dart';
import 'package:newskaapp/Pages/HomePage/HomePage.dart';
import 'package:newskaapp/Pages/HomePageController.dart';
import 'Pages/Profile/ProfilePage.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newskaapp/config/theme.dart';
//import 'package:newskaappp/Demopage.dart';
//import 'package:newskaapp/HomePageController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavigationcontroller controller =
        Get.put(Bottomnavigationcontroller());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
        home: const Homepagecontroller());
    //home: Demopage());
  }
}
