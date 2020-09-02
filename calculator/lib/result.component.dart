import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String result;

  Result({this.result});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.orange,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          result,
          style: TextStyle(
              color: Colors.white,
              fontSize: 70,
              letterSpacing: 0,
              fontWeight: FontWeight.normal),
          textAlign: TextAlign.end,
        ),
      ),
      width: double.infinity,
    );
  }
}
