import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_error.dart';

class Api {
  static const ENDPOINT = 'newsdata.io';
  static const VERSION_API = 'api';
  static const API_KEY = 'pub_35357d5ae542ba8872a68f7ed67508938b7ea';

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    params = _normalizeParameters(params);

    Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path', params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? params}) async {
    params = _normalizeParameters(params);

    Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path', params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  Map<String, dynamic> _normalizeParameters(Map<String, dynamic>? params) {
    params ??= {};
    params['apikey'] = API_KEY;

    params.removeWhere((key, value) => value == null || value == '');

    return params;
  }
}
