import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:http/http.dart';
import 'package:weather_app/weatherapp/model/weather_model.dart';
import 'package:weather_app/weatherapp/util/util.dart';

Alice alice = Alice(showNotification: true);
class Network {

  Future<WeatherForecastModel> getJson({String name}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+
        name +
        "&units=metric"+
        "&appid=" +
        Util.appId;

    final response = await get(Uri.encodeFull(finalUrl));
    alice.onHttpResponse(response);
    return WeatherForecastModel.fromJson(json.decode(response.body));
  }
}
