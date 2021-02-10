import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weatherapp/model/weather_model.dart';
import 'package:weather_app/weatherapp/util/converIcon.dart';
import 'package:weather_app/weatherapp/util/hexcolor.dart';

import 'package:weather_app/weatherapp/util/util.dart';

Widget custom(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var l = snapshot.data.list;
  var fDate;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        //boxShadow: ,
        borderRadius: BorderRadius.circular(40),
        color: HexColor("#1F1A24"),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 308,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: l.length,
          itemBuilder: (context, index) {
            var d = new DateTime.fromMillisecondsSinceEpoch(l[index].dt * 1000);
            fDate = Util.getD(d);
            return GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 10.0, top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        child: (getWeatherIcon(
                            weather: l[index].weather[0].main,
                            size: 28,
                            col: Colors.purple[100])),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "${fDate}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${l[0].weather[0].main}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white60),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${l[0].temp.max.toStringAsFixed(0)}°C  /  ${l[0].temp.min.toStringAsFixed(0)}°C",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor("#BB86FC")),
                      ),
                    ],
                  ),
                ),
                onDoubleTap: () {
                  showGeneralDialog(
                    barrierLabel: "Label",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 400),
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          child: SizedBox.expand(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("More Details",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Pressure: ",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 16,
                                              color: Colors.white,
                                            )),
                                        Text("${l[index].humidity}%",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              color: HexColor("#BB86FC"),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Humidity: ",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 16,
                                              color: Colors.white,
                                            )),
                                        Text("${l[index].humidity}%",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              color: HexColor("#BB86FC"),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Wind Speed: ",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 16,
                                              color: Colors.white,
                                            )),
                                        Text("${l[index].speed}mi/h",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              color: HexColor("#BB86FC"),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          margin:
                              EdgeInsets.only(bottom: 50, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: HexColor("#1F1A24"),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    transitionBuilder: (context, anim1, anim2, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(anim1),
                        child: child,
                      );
                    },
                  );
                });
          },
        ),
      ),
    ),
  );
}
