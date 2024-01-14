import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  // final String textToCopy = 'link';
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
                Text(pubDate),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Country: ${country[0]}'),
                    const SizedBox(width: 20),
                    const Text('Сopy link'),
                    IconButton(
                      icon: const Icon(Icons.content_copy),
                      onPressed: () {
                        _copyToClipboard(link);
                      },
                      iconSize: 20,
                    ),
                  ],
                ),
                const Divider(color: Colors.black),
                Card(
                  color: const Color.fromRGBO(237, 237, 237, 1),
                  child: Text(content),
                ),
              ],
            ),
          )),
    );
  }
}

void _copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
