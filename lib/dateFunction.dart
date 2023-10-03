
import 'package:intl/intl.dart';

DateTime? tempDate;
String? date;
void timeformat(var weather) {
  if (weather != null) {
    tempDate = DateFormat('yyyy-MM-dd').parse(weather.location.localtime);
    date = DateFormat('yyyy-MM-dd').format(tempDate!);
  } else {
    date = 'no value';
  }
}
