import 'package:shared_preferences/shared_preferences.dart';

class LocalDataUtils {
  static Future<String> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('api_key') ?? '';
  }

  static setApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('api_key', '45376223');
  }
}