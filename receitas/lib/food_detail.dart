import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receitas/color.utils.dart';
import 'package:receitas/food.model.dart';

class FoodDetailPageArguments {
  final FoodModel foodModel;
  final int position;

  FoodDetailPageArguments(this.foodModel, this.position);
}

class FoodDetailPage extends StatefulWidget {
  static const routeName = '/second';
  final FoodDetailPageArguments args;

  FoodDetailPage(this.args);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool checkboxValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.foodModel.type),
        backgroundColor: ColorUtils.regularBackground,
      ),
      body: Container(
        color: ColorUtils.regularBackground,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Hero(
                tag: 'image_${widget.args.position}',
                child: Image.asset(
                    'assets/images/position_${widget.args.position + 1}.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.args.foodModel.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.pink,
              height: 100,
            ),
            Container(
              width: double.infinity,
              height: 55,
              child: Row(
                children: [
                  Text(
                    'Chicken breast',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Spacer(),
                  Checkbox(
                    onChanged: (value) => {
                      setState(() {
                        checkboxValue = value;
                      })
                    },
                    activeColor: Colors.orange,
                    value: checkboxValue,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
