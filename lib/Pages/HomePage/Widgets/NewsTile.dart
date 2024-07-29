import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key,
      required this.imageUrl,
      required this.title1,
      required this.time1,
      required this.author1,
      required this.ontap});
  final String imageUrl;
  final String title1;
  final String time1;
  final String author1;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 120,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        width: 8,
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          author1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    title1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Text(
                    time1,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
