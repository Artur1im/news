import 'package:flutter/material.dart';
// import 'package:news/helpers/string_helper.dart';
import 'package:news/pages/single.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String title;
  String link;
  String content;
  String pubDate;
  String? img;
  List<String> country;
  List<String> category;

  CustomCard({
    super.key,
    required this.title,
    required this.link,
    required this.content,
    required this.pubDate,
    required this.img,
    required this.country,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Single(
                    title: title,
                    link: link,
                    content: content,
                    pubDate: pubDate,
                    img: img,
                    country: country,
                    category: category)));
      },
      child: SizedBox(
          child: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          color: const Color.fromRGBO(249, 249, 249, 1),
          child: Row(children: [
            Container(
              width: 50,
              margin: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Image.network(img!),
            ),
            Expanded(
              child: Container(
                height: 150,
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Column(
                  children: [
                    Text(title),
                  ],
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
