import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/network/api.dart';
import 'package:exercicio7start/ui/loader.component.dart';
import 'package:exercicio7start/ui/news_card.component.dart';
import 'package:exercicio7start/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> _news;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getData();
  }

  _getData() async {
    final data = await Api.retrieveNews(context);
    setState(() {
      _news = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.darkBlue,
        centerTitle: true,
        title: Text('News'),
      ),
      body: _news == null
          ? LoaderComponent()
          : Container(
              color: ColorUtils.darkBlue,
              padding: EdgeInsets.all(15),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  News news = _news[index ?? 0] ?? [];
                  return NewsCard(
                    news: news,
                  );
                },
                itemCount: 3,
              ),
            ),
    );
  }
}
