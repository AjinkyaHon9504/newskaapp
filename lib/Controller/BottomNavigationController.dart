import 'package:get/get.dart';
import 'package:newskaapp/Pages/ArticlePage/ArticlePage.dart';
import 'package:newskaapp/Pages/HomePage/HomePage.dart';
import 'package:newskaapp/Pages/Profile/ProfilePage.dart';

class Bottomnavigationcontroller extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    Homepage(),
    Articlepage(),
    Profilepage(),
  ];
}
