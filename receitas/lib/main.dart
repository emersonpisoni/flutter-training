import 'package:flutter/material.dart';
import 'package:receitas/food_detail.dart';
import 'package:receitas/food_list.dart';

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
        '/': (context) => FoodListPage(),
        FoodDetailPage.routeName: (context) =>
            FoodDetailPage(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
