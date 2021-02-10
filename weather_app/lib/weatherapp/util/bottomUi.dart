import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weatherapp/model/weather_model.dart';
import 'package:weather_app/weatherapp/util/converIcon.dart';
import 'package:weather_app/weatherapp/util/util.dart';

Widget bottomUi(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var l = snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "7-Day Weather Forecast",
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: 170,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context , index)=> SizedBox(width: 8,),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var d = new DateTime.fromMillisecondsSinceEpoch(l[index].dt * 1000);
            var fDate = Util.getDay(d);
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              //child: Padding(
              //  padding: const EdgeInsets.only(
              //  left: 5,
              // right: 2,
              //  ),
              child: Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blue[800], Colors.blue[100]],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        fDate,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 25,
                            child: Center(
                              child: getWeatherIcon(
                                  weather: l[index].weather[0].main,
                                  size: 28,
                                  col: Colors.black),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      "${l[index].temp.min.toStringAsFixed(0)}°C"),
                                  Icon(
                                    FontAwesomeIcons.solidArrowAltCircleDown,
                                    color: Colors.black45,
                                    size: 15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      "${l[index].temp.max.toStringAsFixed(0)}°C"),
                                  Icon(
                                    FontAwesomeIcons.solidArrowAltCircleUp,
                                    color: Colors.black45,
                                    size: 15,
                                  ),
                                ],
                              ),
                              Text("Hum:${l[index].humidity}%"),
                              Text("Win:${l[index].speed}mi/h"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: l.length,
        ),
      ),
    ],
  );
}
