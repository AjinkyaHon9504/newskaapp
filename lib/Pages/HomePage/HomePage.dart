import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newskaapp/Components/NavigationBar.dart';
import 'package:newskaapp/Components/NewsTileLoading.dart';
import 'package:newskaapp/Components/TrandingLoadingCard.dart';
import 'package:newskaapp/Controller/NewsCoontroller.dart';
import 'package:newskaapp/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:newskaapp/Pages/HomePage/Widgets/TrendingCard.dart';
import 'package:newskaapp/Pages/NewsDetails/NewsDetails.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscoontroller newscoontroller = Get.put(Newscoontroller());
    return Scaffold(
        floatingActionButton: MyBottomNav(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(Icons.dashboard),
                    ),
                    Text(
                      "TAAZAKHABAR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        newscoontroller.getBuizNews();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(Icons.person),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GARMA GARAM NEWS",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => newscoontroller.isTrendingLoading.value
                          ? Row(
                              children: [
                                Trandingloadingcard(),
                                Trandingloadingcard(),
                              ],
                            )
                          : Row(
                              children: newscoontroller.trandingNewsList
                                  .map(
                                    (e) => TrendingCard(
                                      ontap: () {
                                        Get.to(NewsdetailsPage(
                                          news: e,
                                        ));
                                      },
                                      title: e.title!,
                                      author: e.author ?? "Ghumnaam",
                                      imageUrl: e.urlToImage ??
                                          "https://cdn11.bigcommerce.com/s-9ivpkmlsfd/images/stencil/1280x1280/products/2770/15533/image__36551.1666903521.jpg?c=1?imbypass=on",
                                      tag: "Trending",
                                      time: e.publishedAt!,
                                    ),
                                  )
                                  .toList()),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "News For You",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => newscoontroller.isBuizLoading.value
                      ? Column(
                          children: [
                            Newstileloading(),
                            Newstileloading(),
                            Newstileloading(),
                          ],
                        )
                      : Column(
                          children: newscoontroller.BuizNewsfu.map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(NewsdetailsPage(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://th.bing.com/th/id/R.5dffc12f51e19b24faa9c5c289da3d4a?rik=dd8J7td57TENKg&riu=http%3a%2f%2fberkshirebsa.com%2fwp-content%2fuploads%2f2019%2f12%2fBusiness-Success.jpeg&ehk=iMVGBS5%2bjMiputhhDf6Ahb1ErSLW063V%2bxasHvfrSMQ%3d&risl=&pid=ImgRaw&r=0",
                              title1: e.title!,
                              author1: e.author ?? "Guddu Pandit",
                              time1: e.publishedAt!,
                            ),
                          ).toList(),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Bolly News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => newscoontroller.isBollyLoading.value
                      ? Column(
                          children: [
                            Newstileloading(),
                            Newstileloading(),
                            Newstileloading(),
                          ],
                        )
                      : Column(
                          children: newscoontroller.BollyNews3.map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(NewsdetailsPage(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://image.freepik.com/free-vector/illustration-realistic-bollywood-cinema-sign_23-2148470398.jpg",
                              title1: e.title!,
                              author1: e.author ?? "Orry",
                              time1: e.publishedAt!,
                            ),
                          ).toList(),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TECHIE NEWS",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => newscoontroller.isTechLoading.value
                          ? Row(
                              children: [
                                Trandingloadingcard(),
                                Trandingloadingcard(),
                              ],
                            )
                          : Row(
                              children: newscoontroller.TechNewsList.map(
                              (e) => TrendingCard(
                                ontap: () {
                                  Get.to(NewsdetailsPage(
                                    news: e,
                                  ));
                                },
                                title: e.title!,
                                author: e.author ?? "Ghumnaam",
                                imageUrl: e.urlToImage ??
                                    "https://th.bing.com/th/id/OIP.b-a-WSAWX1UFG9xGID4aswHaHa?rs=1&pid=ImgDetMain",
                                tag: "Trending",
                                time: e.publishedAt!,
                              ),
                            ).toList()),
                    )),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ));
  }
}
