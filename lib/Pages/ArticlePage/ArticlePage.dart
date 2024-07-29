import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newskaapp/Controller/NewsCoontroller.dart';
import 'package:newskaapp/Pages/ArticlePage/Widgets/SearchWidget.dart';
import 'package:newskaapp/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:newskaapp/Pages/NewsDetails/NewsDetails.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscoontroller newscoontroller = Get.put(Newscoontroller());
    //Newscoontroller newscoontroller = Get.put(Newscoontroller());
    //TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Searchwidget(),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => Column(
                    children: newscoontroller.BuizNewsList.map(
                  (e) => NewsTile(
                    ontap: () {
                      Get.to(NewsdetailsPage(news: e));
                    },
                    imageUrl: e.urlToImage ??
                        "https://cdn11.bigcommerce.com/s-9ivpkmlsfd/images/stencil/1280x1280/products/2770/15533/image__36551.1666903521.jpg?c=1?imbypass=on",
                    title1: e.title!,
                    author1: e.author ?? "Guddu Pandit",
                    time1: e.publishedAt!,
                  ),
                ).toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
