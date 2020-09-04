import 'package:dio/dio.dart';
import 'package:weather/models/weather.response.dart';
import 'package:weather/utils/local_data.utils.dart';

class Api {
  static Future<WeatherResponse> retrieveWeather(int cityWoeid) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.hgbrasil.com/';

    final String apiKey = await LocalDataUtils.getApiKey();
    Response response = await dio.get('weather?woeid=$cityWoeid&key=$apiKey');

    WeatherResponse weatherResponse = WeatherResponse.fromJson(response.data);

    return weatherResponse;
  }
}