import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newskaapp/Components/LoadingContainer.dart';

class Newstileloading extends StatelessWidget {
  const Newstileloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Loadingcontainer(width: 120, height: 120),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Loadingcontainer(width: 30, height: 30),
                    SizedBox(
                      width: 8,
                      //height: 2,
                    ),
                    Loadingcontainer(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 15),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 2, height: 15),
                SizedBox(
                  height: 10,
                ),
                Loadingcontainer(
                    width: MediaQuery.of(context).size.width / 3, height: 15),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Loadingcontainer(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 15),
                    Loadingcontainer(
                        width: MediaQuery.of(context).size.width / 5,
                        height: 15),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
