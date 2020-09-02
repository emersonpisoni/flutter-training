import 'package:flutter/material.dart';
import 'package:receitas/food.model.dart';
import 'package:receitas/food_detail.dart';

class FoodItemComponent extends StatelessWidget {
  int position;
  FoodModel foodModel;

  FoodItemComponent({
    @required this.position,
    @required this.foodModel,
  })  : assert(position != null),
        assert(foodModel != null);

  _goToDetail(BuildContext context) {
    Navigator.pushNamed(context, FoodDetailPage.routeName,
        arguments: FoodDetailPageArguments(this.foodModel, position));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetail(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          height: 160,
          // width: double.infinity,
          color: Colors.grey,
          child: Stack(
            children: [
              Hero(
                tag: 'image_$position',
                child: Image.asset(
                  'assets/images/position_1.jpg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                          decoration: BoxDecoration(
                              color: foodModel.textColor,
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(
                            foodModel.type,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${foodModel.numberOfLikes}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${foodModel.numberOfComments}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.cloud,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 110,
                      child: Text(
                        foodModel.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
