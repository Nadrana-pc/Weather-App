import 'package:geolocator/geolocator.dart';

class LocationProvider {
  double? latitude;
  double? longitute;
  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitute = position.longitude;
    print(latitude);
    
  }
}
