import 'dart:convert';

import 'package:exercicio7start/models/news.model.dart';
import 'package:flutter/cupertino.dart';

class Api {
  static Future<List<News>> retrieveNews(BuildContext context) async {
    final String json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/feed_data.json');

    final dynamic data = JsonDecoder().convert(json);

    List<News> news =
        data['news'].map<News>((dynamic data) => News.fromJson(data)).toList();

    return news;
  }
}
