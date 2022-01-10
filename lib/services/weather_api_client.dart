import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ui_temp/model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>getCurrentdata(String location)async{
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=6b3079630fe19fa55fff58fb4df2bc69");
  var response = await http.get(endpoint);
  var body = jsonDecode(response.body);
  //print(response.body);
  return Weather.fromJson(body);

  }
}