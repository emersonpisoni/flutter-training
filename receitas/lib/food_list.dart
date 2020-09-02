import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receitas/color.utils.dart';
import 'package:receitas/food.model.dart';
import 'package:receitas/food_detail.dart';
import 'package:receitas/food_item.component.dart';

class FoodListPage extends StatefulWidget {
  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  _goToDetail() {
    Navigator.pushNamed(context, '/second');
  }

  List<FoodModel> foodModelList = [
    FoodModel(
        type: 'Appetizer',
        numberOfLikes: 201,
        numberOfComments: 21,
        textColor: ColorUtils.position1TextColor,
        name: 'Spinach & chicken Salad'),
    FoodModel(
        type: 'First dish',
        numberOfLikes: 601,
        numberOfComments: 19,
        textColor: ColorUtils.position2TextColor,
        name: 'Crackers with salmon'),
    FoodModel(
        type: 'Desert',
        numberOfLikes: 5400,
        numberOfComments: 121,
        textColor: ColorUtils.position3TextColor,
        name: 'Chocolate cake'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.regularBackground,
        elevation: 0,
        title: Text('Delicious'),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          color: ColorUtils.regularBackground,
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int position) {
                    return FoodItemComponent(
                      position: position,
                      foodModel: foodModelList[position],
                    );
                  }))),
    );
  }
}
