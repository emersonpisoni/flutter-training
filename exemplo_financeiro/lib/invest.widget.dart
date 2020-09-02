import 'package:flutter/material.dart';

class InvestWidget extends StatelessWidget {
  Color backgroundColor;
  String letter;
  String sigla;
  String name;
  String currentValue;
  String valorization;

  InvestWidget(
      {@required this.backgroundColor,
      @required this.letter,
      @required this.sigla,
      @required this.name,
      @required this.currentValue,
      @required this.valorization});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
      ),
      padding: EdgeInsets.all(15),
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Color(0x40FFFFFF),
            ),
            height: 38,
            width: 38,
            child: Center(
              child: Text(
                letter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    sigla,
                    style: TextStyle(color: Colors.white, fontSize: 13.5),
                  ),
                  SizedBox(width: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0x80FFFFFF),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                currentValue,
                style: TextStyle(color: Colors.white, fontSize: 13.5),
              )
            ],
          ),
          Spacer(),
          Text(
            valorization,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
