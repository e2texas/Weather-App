
import 'package:intl/intl.dart';

class Util{
  static String appId="886705b4c1182eb1c69f28eb8c520e20";

  static String getDate(DateTime dateTime)
  {
      return new DateFormat("EEE, MMM d, yy").format(dateTime);
  }
  static String getDay(DateTime dateTime)
  {
      return new DateFormat("EEEEEE").format(dateTime);
  }
  static String getD(DateTime dateTime)
  {
    return new DateFormat("EEE").format(dateTime);
  }
}
