// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    by: json['by'] as String,
    validKey: json['valid_key'] as bool,
    result: Result.fromJson(json['results'] as Map<String, dynamic>),
    executionTime: (json['execution_time'] as num).toDouble(),
    fromCache: json['from_cache'] as bool,
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'by': instance.by,
      'valid_key': instance.validKey,
      'results': instance.result,
      'execution_time': instance.executionTime,
      'from_cache': instance.fromCache,
    };
