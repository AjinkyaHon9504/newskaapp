import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newskaapp/Components/LoadingContainer.dart';

class Trandingloadingcard extends StatelessWidget {
  const Trandingloadingcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      height: 320,
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Loadingcontainer(
              width: MediaQuery.of(context).size.width, height: 180),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 4, height: 10),
              SizedBox(
                height: 10,
              ),
              Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 5, height: 10),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 1.6, height: 15),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 1.9, height: 15),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Loadingcontainer(width: 30, height: 30),
              SizedBox(
                width: 8,
                //height: 2,
              ),
              Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 2, height: 15),
            ],
          )
        ],
      ),
    );
  }
}
