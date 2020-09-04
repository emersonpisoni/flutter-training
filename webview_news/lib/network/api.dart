import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exercicio7start/models/news.model.dart';
import 'package:flutter/cupertino.dart';

class Api {
  static Future<List<News>> retrieveNews(BuildContext context) async {
    Dio dio = Dio();

    Response response = await dio.get(
        'https://api.currentsapi.services/v1/latest-news?apiKey=TrVCpkv_NN6JMBIrSDu53dXUxb2JsAMizPBbzuIZv04Mylgj');

    List<News> news = response.data['news']
        .map<News>((dynamic data) => News.fromJson(data))
        .toList();

    return news;
  }
}
