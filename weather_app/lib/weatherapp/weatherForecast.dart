import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weatherapp/model/weather_model.dart';
import 'package:weather_app/weatherapp/network/network.dart';
import 'package:weather_app/weatherapp/util/bottomUi.dart';

import 'package:geocoding/geocoding.dart';
import 'package:weather_app/weatherapp/util/custom.dart';
import 'package:weather_app/weatherapp/util/hexcolor.dart';
import 'package:weather_app/weatherapp/util/midUi.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Future<WeatherForecastModel> data;
  final Geolocator geolocator = Geolocator();
  Position _currentPosition;
  String _currentAddress;
  String cityName = "delhi";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getCityName(cityN: cityName);
  }

  Future<WeatherForecastModel> getCityName({String cityN}) =>
      new Network().getJson(name: cityName);

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = place.locality;
        cityName = _currentAddress;
        data = getCityName(cityN: cityName);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search..",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.all(8),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  ),
            ),
            onSubmitted: (value) {
              if(value.isNotEmpty) {
                setState(() {
                  cityName = value;
                  data = getCityName(cityN: cityName);
                });
              }
            },
          ),
        ),
        Container(
          child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    midUi(snapshot, context),

                    //bottomUi(snapshot, context),
                    custom(snapshot, context),
                    FloatingActionButton(
                        backgroundColor: HexColor("#03DAC5"),
                        onPressed: _getCurrentLocation,

                        child: Icon(
                          FontAwesomeIcons.searchLocation,
                          color: Colors.black,
                        )),
                  ],
                );
              } else
                return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ]),
    );
  }
}
