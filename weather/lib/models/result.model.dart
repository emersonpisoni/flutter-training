import 'package:weather/models/forecast.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.model.g.dart';

@JsonSerializable(nullable: false)
class Result {
  final int temp;
  final String date;
  final String time;
  @JsonKey(name: 'condition_code')
  final String conditionCode;
  final String description;
  final String currently;
  final String cid;
  final String city;
  @JsonKey(name: 'img_id')
  final String imgId;
  final int humidity;
  @JsonKey(name: 'wind_speedy')
  final String windSpeedy;
  final String sunrise;
  final String sunset;
  @JsonKey(name: 'condition_slug')
  final String conditionSlug;
  @JsonKey(name: 'city_name')
  final String cityName;
  @JsonKey(name: 'forecast')
  final List<Forecast> forecasts;

  Result({
    this.temp,
    this.date,
    this.time,
    this.conditionCode,
    this.description,
    this.currently,
    this.cid,
    this.city,
    this.imgId,
    this.humidity,
    this.windSpeedy,
    this.sunrise,
    this.sunset,
    this.conditionSlug,
    this.cityName,
    this.forecasts,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);
}
