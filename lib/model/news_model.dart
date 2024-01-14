import 'package:news/helpers/list_converter.dart';

class NewsModel {
  String title;
  String link;
  String content;
  String pubDate;
  String? img;
  List<String> country;
  List<String> category;
  String language;

  NewsModel.fromJson(Map<String, dynamic> data)
      : title = data['title'],
        link = data['link'],
        content = data['content'],
        pubDate = data['pubDate'],
        img = data['image_url'],
        country = ListConverter.convertDynamicToString(data['country']),
        category = ListConverter.convertDynamicToString(data['category']),
        language = data['language'];

  static List<NewsModel> fromJsonToList(List<dynamic> data) {
    List<NewsModel> response = [];

    for (Map<String, dynamic> item in data) {
      response.add(NewsModel.fromJson(item));
    }

    return response;
  }
}
