import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/network/api.dart';
import 'package:exercicio7start/ui/news_detail.page.dart';
import 'package:exercicio7start/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({@required this.news});

  _goToLink(BuildContext context) {
    Navigator.pushNamed(context, NewsDetail.routeName,
        arguments: NewsDetailPageArguments(news.url, news.author));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToLink(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: ColorUtils.cardNewsBackground,
          ),
          child: Stack(
            children: [
              Image.network(
                news.image,
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: ColorUtils.cardNewsTitle,
                      ),
                      height: 25,
                      child: Text(
                        'general',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        news.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        news.description,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
