import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_error.dart';

class Api {
  static const ENDPOINT = 'newsdata.io';
  static const VERSION_API = 'api';
  static const API_KEY = 'apikey=pub_35357a501479431bb67e262b4947ff471522b';

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path $API_KEY', params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  Future<dynamic> post(String path, String API_KEY,
      {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path $API_KEY', params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  // Future<dynamic> post(String path, {Map<String, dynamic>? params}) async {
  //   Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path');
  //   http.Response response =
  //       await http.post(url, body: params, headers: _headers);
  //   Map<String, dynamic> content = jsonDecode(response.body);
  //   if (response.statusCode != 200) {
  //     throw ApiError(response.statusCode, content.toString());
  //   }
  //   return content;
  // }
}
