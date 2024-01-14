import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  String title;
  String link;
  String content;
  String pubDate;
  String? img;
  List<String> country;
  List<String> category;

  Single({
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen news'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    child: Row(children: [
                  Container(
                    width: 100,
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
                  Flexible(child: Text(title)),
                ])),
                const Divider(color: Colors.black),
                Card(
                  color: const Color.fromRGBO(237, 237, 237, 1),
                  child: Text(content),
                )
              ],
            ),
          )),
    );
  }
}
