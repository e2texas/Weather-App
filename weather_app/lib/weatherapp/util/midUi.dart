import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weatherapp/model/weather_model.dart';
import 'package:weather_app/weatherapp/util/converIcon.dart';

import 'package:weather_app/weatherapp/util/util.dart';

Widget midUi(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var l = snapshot.data.list;
  var fDate = new DateTime.fromMillisecondsSinceEpoch((l[0].dt) * 1000);
  var lUsed = l[0];
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${snapshot.data.city.name} , ${snapshot.data.city.country}",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          "${Util.getDate(fDate)}",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: (getWeatherIcon(
              weather: lUsed.weather[0].main,
              size: 100,
              col: Colors.purple[100])),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${lUsed.temp.day.toStringAsFixed(0)}°C",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${lUsed.weather[0].main.toUpperCase()}",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${lUsed.speed.toStringAsFixed(0)}mi/h",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 15,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${lUsed.humidity.toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 15,
                      color: Colors.white60,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${lUsed.temp.max.toStringAsFixed(0)}°C",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(
                      height: 5,
                    ),
                    Icon(FontAwesomeIcons.temperatureHigh,
                        size: 15, color: Colors.white60),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
