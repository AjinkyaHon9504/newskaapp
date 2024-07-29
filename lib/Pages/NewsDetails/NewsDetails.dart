import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newskaapp/Controller/NewsCoontroller.dart';
import 'package:newskaapp/Model/NewsModel.dart';

class NewsdetailsPage extends StatelessWidget {
  final NewsModel news;

  const NewsdetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    Newscoontroller newscoontroller = Get.put(Newscoontroller());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Text("Back"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      //color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            news.urlToImage ??
                                "https://th.bing.com/th/id/OIP.jN5PVFAnRAmz83m1DgWYJAHaE0?w=769&h=500&rs=1&pid=ImgDetMain",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  news.title!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      news.publishedAt ?? "dk",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      news.author ?? "gumnaam",
                      style: TextStyle(
                          fontSize: 17,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // height: 30,
                  child: Row(
                    children: [
                      Obx(
                        () => newscoontroller.isSpeeking.value
                            ? IconButton(
                                onPressed: () {
                                  newscoontroller.stop();
                                },
                                icon: const Icon(
                                  Icons.stop,
                                  size: 50,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  newscoontroller.speak(
                                      news.description ?? "No Description");
                                },
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 50,
                                ),
                              ),
                      ),
                      Expanded(
                          child: Obx(
                        () => Lottie.asset(
                          "Assets/Animation/Animation - 1722067820588.json",
                          height: 70,
                          animate: newscoontroller.isSpeeking.value,
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  child: Text(
                    news.description ?? "discription not updated",
                    style: TextStyle(
                        fontSize: 17,
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
