import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper_api_flutter_app/utils/model/model.dart';

class WeatherApiHelper {
  WeatherApiHelper._();

  static WeatherApiHelper apiHelper = WeatherApiHelper._();

  Future<Current?> getApi() async {
    http.Response response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=2f9ded5d41b641d59cd54810230607&q=India&aqi=no"));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      Current post = Current.fromMap(data: decodedData['current']);
      print("====================");
      print("${response}");
      print("====================");
      return post;
    }
    return null;
  }
}
