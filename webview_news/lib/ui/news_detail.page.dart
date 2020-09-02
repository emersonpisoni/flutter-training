import 'package:exercicio7start/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPageArguments {
  final String url;
  final String author;

  NewsDetailPageArguments(this.url, this.author);
}

class NewsDetail extends StatelessWidget {
  static const routeName = '/detail';
  final NewsDetailPageArguments args;

  const NewsDetail(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.darkBlue,
        title: Text(args.author),
      ),
      body: Container(
        color: ColorUtils.darkBlue,
        child: WebView(initialUrl: args.url,),
      ),
    );
  }
}
