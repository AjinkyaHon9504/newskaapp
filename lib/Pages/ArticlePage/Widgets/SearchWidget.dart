import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newskaapp/Controller/NewsCoontroller.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    Newscoontroller newscoontroller = Get.put(Newscoontroller());
    TextEditingController searchController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search news...",
                //    prefixIcon: Icon(Icons.search),

                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(() => newscoontroller.isBuizLoading.value
              ? Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(10),
                  //color: Colors.amber,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : InkWell(
                  onTap: () {
                    newscoontroller.searchNews(searchController.text);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    //color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: Icon(Icons.search),
                  ),
                ))
        ],
      ),
    );
  }
}
