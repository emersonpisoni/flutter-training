import 'package:flutter/material.dart';
import 'package:weather/models/forecast.model.dart';
import 'package:weather/utils/image.utils.dart';

class ForecastComponent extends StatelessWidget {
  final Forecast forecast;

  const ForecastComponent({@required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                child: Text(
                  forecast.weekday,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 60,
              ),
              ImageUtils.getSvgForCondition(forecast.condition),
              Spacer(),
              Text(
                forecast.max.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8,),
              Text(
                forecast.min.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
