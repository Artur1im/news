class NewsModel {
  String title;
  String link;
  String content;
  String pubDate;
  String img;
  List<String> country;
  List<String> category;
  String language;

  NewsModel.fromJson(Map<String, dynamic> data)
      : title = data['title'],
        link = data['link'],
        content = data['content'],
        pubDate = data['pubDate'],
        img = data['image_url'],
        country = data['country'],
        category = data['category'],
        language = data['language'];

  static List<NewsModel> fromJsonToList(Map<String, dynamic> data) {
    List<NewsModel> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(NewsModel.fromJson(item));
    }

    return response;
  }
}
