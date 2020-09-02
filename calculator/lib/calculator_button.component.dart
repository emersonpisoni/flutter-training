import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String content;
  Color color;
  Color fontColor;
  Function callback;

  CalculatorButton({this.content, this.color, this.fontColor, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: FlatButton(
          onPressed: () => callback(content),
          child: Text(
            content,
            style: TextStyle(color: fontColor, fontSize: 36),
          ),
        ),
      ),
    );
  }
}
