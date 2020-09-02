import 'package:flutter/material.dart';

class FoodModel {
  String type;
  int numberOfLikes;
  int numberOfComments;
  String name;
  Color textColor;

  FoodModel(
      {this.type,
      this.numberOfLikes,
      this.numberOfComments,
      this.name,
      this.textColor});
}
