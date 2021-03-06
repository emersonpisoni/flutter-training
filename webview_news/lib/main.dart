import 'package:exercicio7start/ui/home.page.dart';
import 'package:exercicio7start/ui/news_detail.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        NewsDetail.routeName: (context) =>
            NewsDetail(ModalRoute.of(context).settings.arguments)
      },
    );
  }
}
