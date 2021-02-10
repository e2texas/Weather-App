import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weather, double size, Color col }) {
  switch (weather) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.sun,
          size: size,
          color: col,
        );
      }
      break;
    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          size: size,
           color: col,
        );
      }
      break;
    case "Wind":
      {
        return Icon(
          FontAwesomeIcons.wind,
          size: size,
           color: col,
        );
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          size: size,
           color: col,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowflake,
          size: size,
           color: col,
        );
      }
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          size: size,
           color: col,
        );
      }
      break;
  }
}
