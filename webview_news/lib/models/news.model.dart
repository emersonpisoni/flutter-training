import 'package:flutter/cupertino.dart';

class News {
  final String name;
  final String url;
  final String image;
  final String title;
  final String description;
  final String author;

  News({
    @required this.name,
    @required this.url,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.author,
  })  : assert(name != null),
        assert(url != null),
        assert(image != null),
        assert(title != null),
        assert(image != null),
        assert(author != null);

  News.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        url = jsonMap['url'],
        image = jsonMap['image'],
        title = jsonMap['title'],
        description = jsonMap['description'],
        author = jsonMap['author'];
}
