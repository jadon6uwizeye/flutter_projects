// a card component to be reused
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final AssetImage image;
  final int rating;

  const CardComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    // width of the screen considering the safearea
    final width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: width * 0.4,
        height: height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: image,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color.fromRGBO(210, 210, 219, 1),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 249, 248, 245),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 226, 201, 8),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 9, 9, 9),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
