import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:newskaapp/Model/NewsModel.dart';

class Newscoontroller extends GetxController {
  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> BuizNewsList = <NewsModel>[].obs;
  RxList<NewsModel> BuizNewsfu = <NewsModel>[].obs;
  RxList<NewsModel> BollyNewsList = <NewsModel>[].obs;
  RxList<NewsModel> BollyNews3 = <NewsModel>[].obs;
  RxList<NewsModel> TechNewsList = <NewsModel>[].obs;
  RxList<NewsModel> TechNews3 = <NewsModel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isBuizLoading = false.obs;
  RxBool isBollyLoading = false.obs;
  RxBool isTechLoading = false.obs;
  RxBool isSpeeking = false.obs;
  FlutterTts flutterTts = FlutterTts();

  void onInit() async {
    super.onInit();
    getTrendingNews();
    getBuizNews();
    getBollyNews();
    getTechNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=7b6aca6624794e58a11942bd141a4c45";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      } else {  
        
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isTrendingLoading.value = false;
  }

  Future<void> getBuizNews() async {
    isBuizLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=7b6aca6624794e58a11942bd141a4c45";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          BuizNewsList.add(NewsModel.fromJson(news));
        }
        BuizNewsfu.value = BuizNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isBuizLoading.value = false;
  }

  Future<void> getBollyNews() async {
    isBollyLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=7b6aca6624794e58a11942bd141a4c45";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          BollyNewsList.add(NewsModel.fromJson(news));
        }
        BollyNews3.value = BollyNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isBollyLoading.value = false;
  }

  Future<void> getTechNews() async {
    isTechLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=7b6aca6624794e58a11942bd141a4c45";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          TechNewsList.add(NewsModel.fromJson(news));
        }
        TechNews3.value = TechNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isTechLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isBuizLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=$search&apiKey=7b6aca6624794e58a11942bd141a4c45";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        BuizNewsList.clear();
        int i = 0;

        for (var news in articals) {
          i++;
          BuizNewsList.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isBuizLoading.value = false;
  }

  Future<void> speak(String text) async {
    isSpeeking.value = true;
    await flutterTts.setLanguage("en-UK");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  void stop() async {
    await flutterTts.stop();
    isSpeeking.value = false;
  }
}
