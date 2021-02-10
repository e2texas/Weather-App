import 'package:flutter/material.dart';
import 'package:weather_app/weatherapp/model/weather_model.dart';
import 'package:weather_app/weatherapp/util/hexcolor.dart';
import 'package:weather_app/weatherapp/util/util.dart';

class SecondCustom extends StatelessWidget {
  final Lista list;

  const SecondCustom({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var d = new DateTime.fromMillisecondsSinceEpoch(list.dt * 1000);
    var fDate = Util.getDay(d);
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
              decoration: BoxDecoration(
                //boxShadow: ,
                borderRadius: BorderRadius.circular(10),
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
              child: Center(child: Text(list.clouds.toString()))),
        ],
      ),
    ));
  }

}
