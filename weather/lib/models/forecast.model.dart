import 'package:json_annotation/json_annotation.dart';

part 'forecast.model.g.dart';

@JsonSerializable(nullable: false)
class Forecast {
  final String date;
  final String weekday;
  final int max;
  final int min;
  final String description;
  final String condition;

  Forecast({
    this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
