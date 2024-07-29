import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newskaapp/Controller/BottomNavigationController.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavigationcontroller controller =
        Get.put(Bottomnavigationcontroller());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: 200,
            height: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () => controller.index.value = 0,
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: controller.index.value == 0
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.home,
                            size: 25,
                            color: controller.index.value == 0
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                          ),
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => controller.index.value = 1,
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: controller.index.value == 1
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.book,
                            size: 25,
                            color: controller.index.value == 1
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                          ),
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => controller.index.value = 2,
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: controller.index.value == 2
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: 25,
                            color: controller.index.value == 2
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
