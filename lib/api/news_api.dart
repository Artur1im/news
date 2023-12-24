import 'package:news/api/api.dart';
import 'package:news/api/api_error.dart';
import 'package:news/model/news_model.dart';

class NewsApi extends Api {
  Future<List<NewsModel>> news({required int count}) async {
    try {
      Map<String, dynamic> data =
          await get('/', params: {'results': count.toString()});

      return NewsModel.fromJsonToList(data);
    } on ApiError catch (_) {
      return [];
    }
  }
}
