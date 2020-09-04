import 'package:weather/models/result.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.response.g.dart';

@JsonSerializable(nullable: false)
class WeatherResponse {
  final String by;
  @JsonKey(name: 'valid_key')
  final bool validKey;
  @JsonKey(name: 'results')
  final Result result;
  @JsonKey(name: 'execution_time')
  final double executionTime;
  @JsonKey(name: 'from_cache')
  final bool fromCache;

  WeatherResponse({
    this.by,
    this.validKey,
    this.result,
    this.executionTime,
    this.fromCache,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
