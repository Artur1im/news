import 'package:news/api/api.dart';
import 'package:news/api/api_error.dart';
import 'package:news/model/news_model.dart';

class NewsApi extends Api {
  Future<Map<String, dynamic>> news({String? page}) async {
    try {
      Map<String, dynamic> data = await get('/news', params: {'page': page});

      return {
        'news': NewsModel.fromJsonToList(data['results']),
        'nextPage': data['nextPage'],
      };
    } on ApiError catch (_) {
      return {};
    }
  }
}
