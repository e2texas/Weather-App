import 'package:flutter/material.dart';
import 'package:weather_app/weatherapp/util/hexcolor.dart';
import 'package:weather_app/weatherapp/weatherForecast.dart';
import 'package:alice/alice.dart';

Alice alice = Alice(showNotification: true);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      title: 'Weatherify',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#121212"),
      ),
      home: Weather(),
    );
  }
}